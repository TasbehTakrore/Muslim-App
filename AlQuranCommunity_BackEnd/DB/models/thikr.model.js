const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');


const thikrModel = sequelize.define('Thikr', {
    // Model attributes are defined here


    morning: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },
    
    evening: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },
    sleeping: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },
    wakingup: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },
    pray: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },
    wudu: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },

  }, {
    indexes: [
        {
          unique: true,
          fields: ['id', 'created_at'],
        },
      ],
    // Other model options go here
  }
  );
  ThikrModel.belongsTo(UserModel, { foreignKey: 'id' });

  module.exports= thikrModel