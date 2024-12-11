const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');


const prayModel = sequelize.define('Pray', {
    // Model attributes are defined here


    fajr: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },
    
    duhur: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },
    asr: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },
    maghrib: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },
    isha: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },
    qiyam: {
        type: DataTypes.BOOLEAN,
        allowNull: true,
        defaultValue:false,
    },

  }, {
    // Other model options go here
  }
  );
  prayModel.belongsTo(UserModel, { foreignKey: 'id' });

  module.exports= prayModel