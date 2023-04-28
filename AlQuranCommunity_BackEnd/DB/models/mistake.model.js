const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');


const mistakeModel = sequelize.define('Mistake', {
    // Model attributes are defined here
    
    userEmail: {
      type: DataTypes.STRING(255),
      primaryKey: true,
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
    
    mistakeType: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate:{
          isInt:{
            args: true,
            msg:"must be 0 or 1"
          },
          min:{
            args: -1,
            msg:"hint"
          },
          max:{
            args: 2,
            msg:"mistake"
          }
        },
    },
    weight: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate:{
          isInt:{
            args: true,
            msg:"when insert, 50 for hint, and 100 for mistake"
          },
          min:{
            args: -1,
            msg:"min weight"
          },
        },
    },
    surahId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        validate:{
          isInt:{
            args: true,
            msg:"surah Id"
          },
          min:{
            args: 1,
            msg:"al-fateha"
          },
          max:{
            args: 114,
            msg:"al-nase"
          }
        },
    },
    ayahId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        validate:{
          isInt:{
            args: true,
            msg:"ayah Id"
          },
          min:{
            args: 1,
            msg:"first ayah"
          },
          max:{
            args: 286,
            msg:"maximum Id ever - baqarah"
          }
        },
    },   
  }, {
    // Other model options go here
  }
  );

  module.exports= mistakeModel
