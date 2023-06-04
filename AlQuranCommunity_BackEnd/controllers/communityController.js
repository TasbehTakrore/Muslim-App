const communityModel = require("../DB/models/community.model");
const communityMemberModel = require("../DB/models/community_member.model");
const communityRequestModel = require("../DB/models/communityRequest.model");

const createCommunity = async(req, res) => {
  try {
    const {communityChatID, communityName, communityDescription, stickyMessage, adminEmail, usersGender, timerFlag } = req.body;
    
    const community = await communityModel.create({
      communityChatID,
      communityName,
      communityDescription,
      stickyMessage,
      adminEmail,
      usersGender,
      timerFlag
    });

    return res.status(200).json({
      message: "Community created successfully",
      community
    });

  } catch (error) {
    console.log("fail create Community!" + error);

    return res.status(500).json({
      message: "Something went wrong while creating the community",
      error: error.message
    });
  }
}


const findAllCommunitiesFemale = async (req, res) => {
    try {
      console.log("-------------------------------------");
      const communities = await communityModel.findAll({where: {usersGender:'female'}});
      return res.status(200).json({
        message: "All Communities",
        communities,
      });
    } catch (error) {
      console.log("fail get all Communities!" + error);
      return res.status(500).json({
        message: "Something went wrong while fetching the communities",
        error: error.message,
      });
    }
  };

  const findAllCommunities = async (req, res) => {
    try {
      console.log("-------------------------------------");
      const communities = await communityModel.findAll();
      return res.status(200).json({
        message: "All Communities",
        communities,
      });
    } catch (error) {
      console.log("fail get all Communities!" + error);
      return res.status(500).json({
        message: "Something went wrong while fetching the communities",
        error: error.message,
      });
    }
  };


  const findAllCommunitiesMale = async (req, res) => {
    try {
      console.log("----------------***---------------------");

      const communities = await communityModel.findAll({where: {usersGender:'male'}});
      return res.status(200).json({
        message: "All Communities",
        communities,
      });
    } catch (error) {
      console.log("fail get all Communities!" + error);
      return res.status(500).json({
        message: "Something went wrong while fetching the communities",
        error: error.message,
      });
    }
  };

  const addMemberCommunity = async (req, res) => {
    try {

      const {communityID, userEmail , isAdmin} = req.body;
      console.log("bgjmkdls,;fmkgnjfdkm"+req.body);
      const request = await communityMemberModel.create({
        communityID,
        userEmail,
        isAdmin
      });
      const deletedRequest = await communityRequestModel.destroy({
        where: {
            communityID: communityID,
            userReqEmail:  userEmail
        }
      });
      
      res.status(200).json({ message: "member added sucsses" });
    } catch (error) {
      res.status(500).json({ error: "Error! "+error });
    }

  };
  const getAllCommunityMembers = async (req, res) => {
    try {
      const communityID = req.params.communityID;
  
      const members = await communityMemberModel.findAll({
        where: { communityID },
      });
  
      res.status(200).json({ members });
    } catch (error) {
      res.status(500).json({ error: "Error! " + error });
    }
  };
  

  const getMyCommunities = async (req, res) => {
    try {
      const { userEmail } = req.params;
      const communities = await communityMemberModel.findAll({
        where: {
          userEmail: userEmail
        }
      });
  
      res.status(200).json({ communities });
      console.log("getMyCommunities ++++ "+res);

    } catch (error) {
      res.status(500).json({ error: "Error! " + error });
    }
  };
  


  const requestToCommunity = async (req, res) => {
    try {
      const { communityID, userReqEmail } = req.body;
      
      const request = await communityRequestModel.create({
        communityID,
        userReqEmail
      });
      
      res.status(200).json({ message: "req send sucsses" });
    } catch (error) {
      res.status(500).json({ error: "Error!" });
    }
  };
  
  const deleteRequest = async (req, res) => {
      console.log("ngfsdmkl,a");
      try {
        const { communityID, userReqEmail } = req.params;
        
        const deletedRequest = await communityRequestModel.destroy({
          where: {
              communityID,
              userReqEmail
          }
        });
        
        if (deletedRequest) {
          res.status(200).json({ message: "Request deleted successfully" });
        } else {
          res.status(404).json({ error: "Request not found" });
        }
      } catch (error) {
        res.status(500).json({ error: "Error!" });
      }
    };
    
    const getAllMemberRequests = async (req, res) => {
      try {
        const { communityID } = req.params;
        
        const requests = await communityRequestModel.findAll({ where:{ communityID:communityID }});
        
        res.status(200).json({ requests });
      } catch (error) {
        res.status(500).json({ error: "Error!"+ error});
      }
    };
    
   const addStickyMessage =  async (req, res) => {
      try {
        const { communityId, stickyMessage } = req.body;
    
        const community = await communityModel.findByPk(communityId);
        if (!community) {
          return res.status(404).json({ message: 'Community not found' });
        }
    
        community.stickyMessage = stickyMessage;
        await community.save();
    
        return res.status(200).json({ message: 'Sticky message added successfully' });
      } catch (error) {
        console.error('Error adding sticky message:', error);
        return res.status(500).json({ message: 'Internal server error' });
      }
    }

    const getStickyMessage =  async (req, res) => {
      try {
        const { communityId } = req.params;
    
        const community = await communityModel.findByPk(communityId);
        if (!community) {
          return res.status(404).json({ message: 'Community not found' });
        }
    
        return res.status(404).json({ stickyMessage: community.stickyMessage });

      } catch (error) {
        console.error('Error get sticky message:', error);
        return res.status(500).json({ message: 'Internal server error' });
      }
    }







module.exports = {createCommunity, findAllCommunitiesFemale, findAllCommunitiesMale, addMemberCommunity, getMyCommunities,requestToCommunity, deleteRequest, getAllMemberRequests, getAllCommunityMembers, findAllCommunities, addStickyMessage, getStickyMessage};