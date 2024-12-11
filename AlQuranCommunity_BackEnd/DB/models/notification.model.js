const  {sequelize }= require('../connection')
const { DataTypes } = require('sequelize');
const UserModel = require('../models/user.model'); 

const userNotification = sequelize.define('userNotification',{
  user_id: {
    primaryKey: true,
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: UserModel,
      key: 'id'
    }
  },
  Planalarm: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: false,
  },
});

module.exports = userNotification;
