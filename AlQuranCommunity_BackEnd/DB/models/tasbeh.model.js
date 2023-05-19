const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');
const { UserModel } = require('./user.model');


const tasbehModel = sequelize.define('tasbehs', {
    user_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: 'users',
          key: 'id'
        }
      },
    subhanAllah: {
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue:0,
      },
    alhamdulliah: {
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue:0,
    },
    LaIlahaElaAllah: {
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue:0,
      },
    AllahuAkbar: {
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue:0,
      },

    LaHawalaWalaQuwaElaBillah: {
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue:0,
    },
    AstagfirAllah: {
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue:0,
    },
    blessingsOnTheProphetMuhammad: {
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue:0,
    },
    custom: {
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue:0,
    },
    total:{
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue:0,

    }

  }, {
    modelName: 'tasbehs',
  }
  );

  module.exports= tasbehModel