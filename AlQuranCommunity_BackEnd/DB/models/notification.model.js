const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');

const notificationModel = sequelize.define('notification', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  scheduledTime: {
    type: DataTypes.DATE,
    allowNull: false
  },
  title: {
    type: DataTypes.STRING,
    allowNull: false
  },
  body: {
    type: DataTypes.STRING,
    allowNull: false
  },
  token: {
    type: DataTypes.STRING,
    allowNull: false
  },
  sound: {
    type: DataTypes.STRING,
    allowNull: true
  }
},{
    sync: {
        // create the table if it doesn't exist
        force: false 
      }
}
);

module.exports = notificationModel;
