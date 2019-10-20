<template>
  <div class="hello">
    <div class="card">
      <a-row>
        <a-col :span="12">
          <h1 style="font-weight: 900; padding-bottom:25px">My Listings</h1>
        </a-col>
        <a-col :span="12" style="text-align:right">
          <a-button
            type="primary"
            class="BuyButton"
            style="font-weight: 900;"
            @click="showModal"
          >Sell your CDP</a-button>
        </a-col>
      </a-row>
      <div v-if="cdpInfo.length>0">
        <a-row>
          <a-col :span="2">
            <h4 style="font-weight: 900; padding-left:15px">CDP #</h4>
          </a-col>
          <a-col :span="3">
            <h4 style="font-weight: 900;">Dai Drawn</h4>
          </a-col>
          <a-col :span="3">
            <h4 style="font-weight: 900;">Collateral/Ratio</h4>
          </a-col>
          <a-col :span="4">
            <h4 style="font-weight: 900;">Outstanding Fees</h4>
          </a-col>
          <a-col :span="3">
            <h4 style="font-weight: 900;">CDP Value</h4>
          </a-col>
          <a-col :span="3">
            <h4 style="font-weight: 900;">Discount</h4>
          </a-col>
          <a-col :span="3">
            <h4 class="PinkText" style="font-weight: 900;">Final Value</h4>
          </a-col>
          <a-col :span="3">
            <h4 style="font-weight: 900;"></h4>
          </a-col>
        </a-row>
        <hr />
        <div v-for="(cdp, index) in cdpInfo" :key="index">
          <a-row
            style="padding-top:15px; padding-bottom:15px;"
            :style="index%2==1?'background:#FFF5F7':'background:white'"
          >
            <a-col style="padding-top:5px" :span="2">
              <h4 style="padding-left:15px">{{cdp.CDPNo}}</h4>
            </a-col>
            <a-col style="padding-top:5px" :span="3">
              <h4>{{cdp.daiDrawn}}</h4>
            </a-col>
            <a-col style="padding-top:5px" :span="3">
              <h4>{{cdp.collateralRatio}}</h4>
            </a-col>
            <a-col style="padding-top:5px" :span="4">
              <h4>{{cdp.fee}}</h4>
            </a-col>
            <a-col style="padding-top:5px" :span="3">
              <h4>{{cdp.value}}</h4>
            </a-col>
            <a-col style="padding-top:5px" :span="3">
              <h4>{{cdp.discount}}</h4>
            </a-col>
            <a-col style="padding-top:5px" :span="3">
              <h4 class="PinkText">{{cdp.finalPrice}} ETH</h4>
            </a-col>
            <a-col :span="3">
              <a-button class="BuyButton" type="primary">Buy</a-button>
            </a-col>
          </a-row>
          <hr style="padding:0px; margin:0px" />
        </div>
      </div>
    </div>
    <a-modal
      class="model"
      :height="500"
      :width="900"
      style="width:900px"
      v-model="visible"
      @ok="handleOk"
    >
      <template slot="footer">
        <div style="text-align:right">
          <a-button
            key="submit"
            type="secondary"
            @click="handleOk"
            style="border-radius: 25px;"
          >Cancel</a-button>
          <a-button
            key="submit"
            class="BuyButton"
            type="primary"
            @click="sellCDP"
            :disabled="debtOrder.cdpId==null"
          >Sell</a-button>
        </div>
      </template>
      <h2 style="padding-bottom:25px">Sell CDP</h2>
      <a-row>
        <a-col :span="16">
          <h3 style="font-weight: 900;">Select</h3>
          <a-row>
            <a-col :span="4">
              <h4 style="font-weight: 900;"></h4>
            </a-col>
            <a-col :span="5">
              <h4 style="font-weight: 900; padding-left:15px">CDP #</h4>
            </a-col>
            <a-col :span="5">
              <h4 style="font-weight: 900;">Total Debt</h4>
            </a-col>
            <a-col :span="5">
              <h4 style="font-weight: 900;">Collateral/Ratio</h4>
            </a-col>
            <a-col :span="4">
              <h4 style="font-weight: 900;">CDP Value</h4>
            </a-col>
          </a-row>
          <hr />
          <div
            v-for="(cdp, index) in cdpInfo"
            :key="index"
            :style="index%2==1?'background:#FFF5F7':'background:white'"
          >
            <div @click="selectCDP(index)" style="cursor: pointer">
              <a-row style="padding-top:15px; padding-bottom:15px;">
                <a-col style="padding-left:25px" :span="4">
                  <a-radio style="padding-top:5px" :checked="cdpInfo[index].selected"></a-radio>
                </a-col>
                <a-col style="padding-top:5px" :span="5">
                  <h4>{{cdp.CDPNo}}</h4>
                </a-col>
                <a-col style="padding-top:5px" :span="5">
                  <h4>{{cdp.daiDrawn}}</h4>
                </a-col>
                <a-col style="padding-top:5px" :span="5">
                  <h4>{{cdp.collateralRatio}}</h4>
                </a-col>
                <a-col style="padding-top:5px" :span="4">
                  <h4>{{cdp.value}} ETH</h4>
                </a-col>
              </a-row>
            </div>
            <hr style="padding:0px; margin:0px" />
          </div>
        </a-col>
        <a-col class="verticalLine" :span="1" />
        <a-col style="padding-left:25px" :span="7">
          <h3 style="padding:5px; font-weight: 900;">Apply A discount</h3>
          <h3 style="padding:5px; font-weight: 900;">Discount</h3>
          <a-input-number :min="1" :max="100" v-model="debtOrder.discount" />
          <h3
            v-if="debtOrder.discount>13"
            style="padding:5px; font-weight: 900; color:#FF2898"
          >Caution: This discount is above the 13% liquidation penalty!</h3>
          <h3 style="padding:5px; font-weight: 900;">You'll get</h3>
          <h3 v-if="debtOrder.cdpId==null" style="padding:5px; font-weight: 900; color:#FF2898">-</h3>
          <h3
            v-if="debtOrder.cdpId!=null"
            style="padding:5px; font-weight: 900; color:#FF2898"
          >{{cdpInfo[debtOrder.debtIndex].value * (100-debtOrder.discount)/100}} ETH</h3>
        </a-col>
      </a-row>
    </a-modal>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";
export default {
  name: "BuyCDP",
  methods: {
    ...mapActions(["SELL_CDP"]),
    sellCDP() {
      console.log("SELLING!");
      this.SELL_CDP(this.debtOrder);
    },
    showModal() {
      this.visible = true;
    },
    handleOk(e) {
      console.log(e);
      this.visible = false;
    },
    selectCDP(cdpId) {
      this.cdpInfo = this.cdpInfo.map(x => {
        x.selected = false;
        return x;
      });
      this.cdpInfo[cdpId].selected = true;
      this.debtOrder.debtIndex = cdpId;
      this.debtOrder.cdpId = this.cdpInfo[cdpId].cdpId;
    }
  },
  data() {
    return {
      debtOrder: {
        discount: 5,
        debtIndex: null,
        cdpId: null
      },
      visible: false,
      cdpInfo: [
        {
          cdpId:
            "0x0000000000000000000000000000000000000000000000000000000000001b4e",
          CDPNo: 69420,
          daiDrawn: 666,
          collateralRatio: "2 Eth | 200%",
          fee: 0.042069,
          value: 1,
          discount: 5,
          finalPrice: 0.95,
          selected: false
        },
        {
          cdpId:
            "0x0000000000000000000000000000000000000000000000000000000000001b4e",
          CDPNo: 69420,
          daiDrawn: 666,
          collateralRatio: "2 Eth | 200%",
          fee: 0.042069,
          value: 1,
          discount: 5,
          finalPrice: 0.95,
          selected: false
        },
        {
          cdpId:
            "0x0000000000000000000000000000000000000000000000000000000000001b4e",
          CDPNo: 69420,
          daiDrawn: 666,
          collateralRatio: "2 Eth | 200%",
          fee: 0.042069,
          value: 1,
          discount: 5,
          finalPrice: 0.95,
          selected: false
        },
        {
          cdpId:
            "0x0000000000000000000000000000000000000000000000000000000000001b4e",
          CDPNo: 69420,
          daiDrawn: 666,
          collateralRatio: "2 Eth | 200%",
          fee: 0.042069,
          value: 1,
          discount: 5,
          finalPrice: 0.95,
          selected: false
        },
        {
          cdpId:
            "0x0000000000000000000000000000000000000000000000000000000000001b4e",
          CDPNo: 69420,
          daiDrawn: 666,
          collateralRatio: "2 Eth | 200%",
          fee: 0.042069,
          value: 1,
          discount: 5,
          finalPrice: 0.95,
          selected: false
        }
      ]
    };
  }
};
</script>

<style scoped>
.card {
  background: white;
  margin: 35px;
  min-height: 700px;
  min-width: 900px;
  border-radius: 25px;
  padding: 25px;
}

.BuyButton {
  background: #ff95cd;
  border: green;
  border-radius: 25px;
  font-weight: 900;
  -webkit-box-shadow: 0px 1px 1px 1px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 1px 1px 1px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 1px 1px 1px rgba(0, 0, 0, 0.15);
}

.PinkText {
  color: #ff1491;
  font-weight: 900;
}

.checkbox {
  background: white;
  border: white;
}

.verticalLine {
  border-right-style: solid;
  height: 400px;
}
</style>

