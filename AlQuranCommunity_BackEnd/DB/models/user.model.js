const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');


const userModel = sequelize.define('User', {
    
    userName: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    userEmail: {
      type: DataTypes.STRING(255),

      allowNull: false,
      unique:true,
      validate:{
        isEmail:{
          args: true,
          msg:"must be an email"
        },
      },
    },
    userAge: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate:{
          isInt:{
            args: true,
            msg:"age must be integer"
          },

          min:{
            args: 1,
            msg:"age can't be less than 1"
          },/*
          max:{
            args: 170,
            msg:"age can't be larger than 170"
          }*/
        },
    },
    userPassword: {
        type: DataTypes.STRING(100),
        allowNull: false
    },
    userCoins: {
      type: DataTypes.INTEGER,
      defaultValue: 0,
  },

  jewel:{
    type:DataTypes.INTEGER,
    defaultValue:0,
  },
    userGender: {
        type: DataTypes.STRING(6),
        allowNull: false,
        validate:{
          isIn:{
            args:[['female', 'male']],
            msg: "must be female or male"
          } ,
        }
    },
    confirmEmail: {
      type: DataTypes.BOOLEAN,
      allowNull: true,
  },
  verifyCode:{
   type: DataTypes.STRING,
   default:null, 
  },
  imageUrl: {
    type: DataTypes.STRING,
    allowNull: true,
    defaultValue: null,
},

  }, {
    // Other model options go here
  }
  );

  module.exports= userModel