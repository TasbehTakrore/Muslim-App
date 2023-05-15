const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');
const UserModel = require('./user.model');
const CommunityModel = require('./community.model');


const communityUserModel = sequelize.define('CommunityUser', {
    // Model attributes are defined here
    
    communityID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: { 
        model: CommunityModel, 
        key: 'id' 
      } ,
    },
    userEmail: {
        type: DataTypes.STRING(255),
        allowNull: false,
        primaryKey: true,
        references: { 
            model: UserModel, 
            key: 'userEmail' 
          } ,
      },   
  }, {
    // Other model options go here
  }
  );

  module.exports= communityUserModel