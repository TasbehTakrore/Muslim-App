const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');
const UserModel = require('../models/user.model'); 

const notificationHistory = sequelize.define('notificationHistory',{
  Notifytitle: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: " ",
  },
  Notifybody: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: " ",
  },
  timestamp: {
    type: DataTypes.DATE,
    defaultValue: () => new Date(), // Set the current device time as the default value

  },
  user_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: UserModel,
      key: 'id'
    }
  },
});

module.exports = notificationHistory;
