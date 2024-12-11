const tasbehModel= require("../DB/models/tasbeh.model");
const { Op, Sequelize} = require('sequelize');
const { sequelize } = require('../DB/connection');

const createTasbehEntry = async (req, res) => {
    try {
      const { user_id, data } = req.body;
  console.log("userId in createTasbehEntry  "+ user_id);
      const {
        subhanAllah,
        alhamdulliah,
        LaIlahaElaAllah,
        AllahuAkbar,
        LaHawalaWalaQuwaElaBillah,
        AstagfirAllah,
        blessingsOnTheProphetMuhammad,
        custom,
      } = data;
  
      // Calculate the total
      const total =
        subhanAllah +
        alhamdulliah +
        LaIlahaElaAllah +
        AllahuAkbar +
        LaHawalaWalaQuwaElaBillah +
        AstagfirAllah +
        blessingsOnTheProphetMuhammad +
        custom;
  
      // Find the existing Tasbeh entry for the user and today's date
      const existingEntry = await tasbehModel.findOne({
        user_id: user_id,
        date: { $gte: new Date().setHours(0, 0, 0, 0), $lt: new Date().setHours(23, 59, 59, 999) },
      });
  
      if (existingEntry) {
        // Update the existing entry
        existingEntry.subhanAllah = subhanAllah;
        existingEntry.alhamdulliah = alhamdulliah;
        existingEntry.LaIlahaElaAllah = LaIlahaElaAllah;
        existingEntry.AllahuAkbar = AllahuAkbar;
        existingEntry.LaHawalaWalaQuwaElaBillah = LaHawalaWalaQuwaElaBillah;
        existingEntry.AstagfirAllah = AstagfirAllah;
        existingEntry.blessingsOnTheProphetMuhammad = blessingsOnTheProphetMuhammad;
        existingEntry.custom = custom;
        existingEntry.total = total;
  
        await existingEntry.save();
  
        return res.status(200).json(existingEntry);
      } else {
        // Create a new entry in the Tasbeh model
        const tasbehEntry = await tasbehModel.create({
          user_id: user_id,
          date: new Date().setHours(0, 0, 0, 0), // Set the time to 00:00:00.000
          subhanAllah: subhanAllah,
          alhamdulliah: alhamdulliah,
          LaIlahaElaAllah: LaIlahaElaAllah,
          AllahuAkbar: AllahuAkbar,
          LaHawalaWalaQuwaElaBillah: LaHawalaWalaQuwaElaBillah,
          AstagfirAllah: AstagfirAllah,
          blessingsOnTheProphetMuhammad: blessingsOnTheProphetMuhammad,
          custom: custom,
          total: total,
        });
  
        return res.status(201).json(tasbehEntry);
      }
    } catch (error) {
      console.error('Error creating/updating Tasbeh entry:', error);
      return res.status(500).json({ error: 'Internal server error' });
    }
  }

  const getUsertasbeh = async (req, res) => {
    try {
      const user_id = req.params.id;
      console.log("222 user_id " + user_id);
      const today = new Date();
      const startOfWeek = new Date(today);
      startOfWeek.setDate(today.getDate() - ((today.getDay() + 1) % 7));
  
      // Adjust the start of the week to midnight
      startOfWeek.setHours(0, 0, 0, 0);
  
      const endOfWeek = new Date(startOfWeek);
      endOfWeek.setDate(endOfWeek.getDate() + 6);
      endOfWeek.setHours(23, 59, 59, 999);
  
      // Remove the time component from createdAt attribute
      const result = await tasbehModel.findAll({
        where: {
          user_id: user_id,
          createdAt: {
            [Op.gte]: startOfWeek,
            [Op.lte]: endOfWeek,
          },
        },
        attributes: [
          [sequelize.fn('SUM', sequelize.col('total')), 'totalSum'],
        ],
        raw: true,
      });
  
      const totalSum = result[0].totalSum || 0;
      return res.json({ totalSum });
    } catch (error) {
      console.error('Error retrieving user counter:', error);
      return res.status(500).json({ error: 'Internal server error' });
    }
  };
  

  module.exports = {
    createTasbehEntry,
    getUsertasbeh,
  };





