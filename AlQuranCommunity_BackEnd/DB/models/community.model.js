const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');
const UserModel = require('./user.model');


const communityModel = sequelize.define('Community', {
    // Model attributes are defined here
    
    communityName: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    communityDescription: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    stickyMessage: {
        type: DataTypes.STRING,
        allowNull: true,
        defaultValue:"",
    },     
    adminEmail: {
        type: DataTypes.STRING(255),
        references: { 
            model: UserModel, 
            key: 'id' 
          } ,
        allowNull: false,
        unique:false,
        references: {
          model: 'users', // اسم الجدول الذي يربط بها
          key: 'userEmail', // اسم العمود الذي سيتم ربطه
        },
        validate:{
          isEmail:{
            args: true,
            msg:"must be an email"
          } 
        },
      },
    usersGender: {
        type: DataTypes.STRING(6),
        allowNull: false,
        validate:{
          isIn:{
            args:[['female', 'male']],
            msg: "must be female or male"
          } ,
        }},
    timerFlage:{
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue: true, // true = visible
    }
  }, {
    // Other model options go here
  }
  );

  module.exports= communityModel