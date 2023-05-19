const  {sequelize }= require('../../connection')
const { DataTypes } = require('sequelize');
const UserModel = require('../user.model'); 

const activePlanModel = sequelize.define('ActivePlan', {
  user_id: {
    primaryKey: true,
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: UserModel,
      key: 'id'
    }
  },
 
  fiveprays: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  
  Duha: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },

  
  qiyam: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },

  traweeh: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },

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

  wudu: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },

  praythikr: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },

  athanthikr:{
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },

  readplan: {
    type: DataTypes.ENUM('none', 'page', 'juz', 'hizb'),
    allowNull: false,
    defaultValue: 'none',
  },
  read_amount: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
  },
 
  tadaburplan: {
    type: DataTypes.ENUM('none', 'page', 'juz', 'hizb'),
    allowNull: false,
    defaultValue: 'none',
  },
  tadabur_amount: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
  },
  
  memorizingplan: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  memorizing_amount: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
  },
 
  fivepraysF:{
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  DuhaF: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  qiyamF: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  traweehF: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  morningF: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  eveningF: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  sleepingF: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  wakingupF: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  wuduF: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  praythikrF: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  athanthikrF:{
    type: DataTypes.BOOLEAN,
    allowNull: true,
    defaultValue:false,
  },
  read_amountCount:{
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
  },
  tadabur_amountCount: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
  },
  memorizing_amountCount: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
  },
  plan_id:{
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue:1,
  },
  }, {
    // Other model options go here
  }
  );
  //activePlanModel.belongsTo(UserModel, { foreignKey: 'user_id' }); 

  module.exports= activePlanModel