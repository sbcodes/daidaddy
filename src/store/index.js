import Web3 from "web3";
import Vuex from "vuex";
import Vue from "vue";
import axios from "axios";
import createPersistedState from "vuex-persistedstate";
import moment from "moment";

import {
  getEtherscanAddress,
  getNetIdString,
}
from "@/utils/lookupTools";

import {
  convertBytes32
}
from "@/utils/convertBytes32";

import * as actions from "./actions";
import * as mutations from "./mutation-types";

import truffleContract from "truffle-contract";

// import FundFactoryABI from "../../build/contracts/FundFactory.json"
// const FundFactory = truffleContract(FundFactoryABI);

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    web3: null,
    account: null,
    currentNetwork: null,
    etherscanBase: null,
    TokenInfo: null,
  },
  mutations: {
    //WEB3 Stuff
    [mutations.SET_ACCOUNT](state, account) {
      state.account = account;
    },
    [mutations.SET_CURRENT_NETWORK](state, currentNetwork) {
      state.currentNetwork = currentNetwork;
    },
    [mutations.SET_ETHERSCAN_NETWORK](state, etherscanBase) {
      state.etherscanBase = etherscanBase;
    },
    [mutations.SET_WEB3]: async function (state, web3) {
      state.web3 = web3;
    },
  },
  actions: {
    [actions.GET_CURRENT_NETWORK]: function ({
      commit,
      dispatch,
      state
    }) {
      getNetIdString().then(currentNetwork => {
        commit(mutations.SET_CURRENT_NETWORK, currentNetwork);
      });
      getEtherscanAddress().then(etherscanBase => {
        commit(mutations.SET_ETHERSCAN_NETWORK, etherscanBase);
      });
    },

    [actions.INIT_APP]: async function ({
      commit,
      dispatch,
      state
    }, web3) {
      // FundFactory.setProvider(web3.currentProvider)
      // Fund.setProvider(web3.currentProvider)
      // Set the web3 instance
      console.log("IN STORE")
      console.log(web3)
      commit(mutations.SET_WEB3, {
        web3
      });
      console.log("set")

      dispatch(actions.GET_CURRENT_NETWORK);

      let accounts = await web3.eth.getAccounts();
      let account = accounts[0];
      if (account) {
        commit(mutations.SET_ACCOUNT, account);
      }
      // let fundFactory = await FundFactory.at(state.factoryAddress)
      // console.log("logging vyper from UI")
      // let numberOfFunds = await fundFactory.getAllFundUids()
      // state.numberOfFunds = numberOfFunds.toString(10)
      // console.log(numberOfFunds.toString())
      // commit(mutations.SET_NUMBER_OF_FUNDS, numberOfFunds.toString());

      // let userFunds = await fundFactory.getFundForOwner.call(state.account)
      // console.log("USER FUNDS")
      // console.log(userFunds)
    },
    [actions.FIND_CDPS]: async function ({
      commit,
      dispatch,
      state
    }, web3) {
      console.log("finding CDPS")

      function numStringToBytes32(num) {
        var bn = new state.web3.web3.utils.BN(num).toTwos(256);
        return padToBytes32(bn.toString(16));
      }

      function bytes32ToNumString(bytes32str) {
        bytes32str = bytes32str.replace(/^0x/, '');
        var bn = new state.web3.web3.utils.BN(bytes32str, 16).fromTwos(256);
        return bn.toString();
      }

      function padToBytes32(n) {
        while (n.length < 64) {
          n = "0" + n;
        }
        return "0x" + n;
      }
      console.log("converting number 5")
      console.log(numStringToBytes32(6990))
    }
  }
})