const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');


const userModel = sequelize.define('User', {
    // Model attributes are defined here
    
    userName: {
      type: DataTypes.STRING(100),
      allowNull: false,
      validate:{
        isAlphanumeric:{
          args: true,
          msg:"user name just include isAlphanumeric values only"
        } 
      },
    },
    userEmail: {
      type: DataTypes.STRING(255),
      allowNull: false,
      unique:true,
      validate:{
        isEmail:{
          args: true,
          msg:"must be an email"
        } 
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
          },
          max:{
            args: 170,
            msg:"age can't be larger than 170"
          }
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
    userGender: {
        type: DataTypes.STRING(6),
        allowNull: true,
        validate:{
          isIn:{
            args:[['female', 'male']],
            msg: "must be female or male"
          } ,
        }
    },
    confirmEmail: {
      type: DataTypes.BOOLEAN,
      defaultValue:false,
      allowNull: false,
  },

  }, {
    // Other model options go here
  }
  );

  module.exports= userModel