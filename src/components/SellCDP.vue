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
    <a-modal class="model" :width="900" style="width:900px" v-model="visible" @ok="handleOk">
      <h2 style="padding-bottom:25px">Sell your CDP</h2>
      <a-row>
        <a-col :span="4">
          <h4 style="font-weight: 900; padding-left:15px">CDP #</h4>
        </a-col>
        <a-col :span="4">
          <h4 style="font-weight: 900;">Dai Drawn</h4>
        </a-col>
        <a-col :span="5">
          <h4 style="font-weight: 900;">Collateral/Ratio</h4>
        </a-col>
        <a-col :span="5">
          <h4 style="font-weight: 900;">Outstanding Fees</h4>
        </a-col>
        <a-col :span="4">
          <h4 style="font-weight: 900;">CDP Value</h4>
        </a-col>
        <a-col :span="2">
          <h4 style="font-weight: 900;"></h4>
        </a-col>
      </a-row>
      <hr />
      <div
        v-for="(cdp, index) in cdpInfo"
        :key="index"
        :style="index%2==1?'background:#FFF5F7':'background:white'"
      >
        <a-row style="padding-top:15px; padding-bottom:15px;">
          <a-col style="padding-top:5px" :span="4">
            <h4 style="padding-left:15px">{{cdp.CDPNo}}</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="4">
            <h4>{{cdp.daiDrawn}}</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="5">
            <h4>{{cdp.collateralRatio}}</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="5">
            <h4>{{cdp.fee}}</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="4">
            <h4>{{cdp.value}}</h4>
          </a-col>
          <a-col :span="2">
            <a-radio :checked="cdpInfo[index].selected" @click="selectCDP(index)"></a-radio>
          </a-col>
        </a-row>
        <hr style="padding:0px; margin:0px" />
      </div>
    </a-modal>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";
export default {
  name: "BuyCDP",
  methods: {
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
    }
  },
  data() {
    return {
      visible: false,
      cdpInfo: [
        {
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
  minheight: 700px;
  minwidth: 900px;
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
</style>

