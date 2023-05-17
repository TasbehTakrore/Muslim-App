const communityModel = require("../DB/models/community.model");
const communityMemberModel = require("../DB/models/community_member.model");

const createCommunity = async(req, res) => {
  try {
    const { communityName, communityDescription, stickyMessage, adminEmail, usersGender, timerFlag } = req.body;
    
    // تنفيذ العملية المطلوبة لإنشاء المجتمع في قاعدة البيانات
    const community = await communityModel.create({
      communityName,
      communityDescription,
      stickyMessage,
      adminEmail,
      usersGender,
      timerFlag
    });

    // رسالة الإستجابة بنجاح إنشاء المجتمع
    return res.status(200).json({
      message: "Community created successfully",
      community
    });

  } catch (error) {
    console.log("fail create Community!" + error);

    // رسالة الإستجابة في حالة وجود خطأ أثناء إنشاء المجتمع
    return res.status(500).json({
      message: "Something went wrong while creating the community",
      error: error.message
    });
  }
}


const findAllCommunitiesFemale = async (req, res) => {
    try {
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

  const findAllCommunitiesMale = async (req, res) => {
    try {
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
      
      res.status(200).json({ message: "member added sucsses" });
    } catch (error) {
      res.status(500).json({ error: "Error! "+error });
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
    } catch (error) {
      res.status(500).json({ error: "Error! " + error });
    }
  };
  

module.exports = {createCommunity, findAllCommunitiesFemale, findAllCommunitiesMale, addMemberCommunity, getMyCommunities};