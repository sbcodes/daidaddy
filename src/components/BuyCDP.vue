<template>
  <div class="hello">
    <div class="card">
      <a-row>
        <a-col :span="12">
          <h1 style="font-weight: 900; padding-bottom:25px">Seeking Arrangements</h1>
        </a-col>
        <a-col :span="12" style="text-align:right"></a-col>
      </a-row>

      <a-row>
        <a-col :span="3">
          <h4 style="font-weight: 900; padding-left:15px">CDP #</h4>
        </a-col>
        <a-col :span="3">
          <h4 style="font-weight: 900;">
            Total Debt
            <a-popover title="Total Debt">
              <template
                slot="content"
              >The total debt on the CDP. This is the total DAI drawn + all fees incurred over the duration of the CDP's lifespan.</template>
              <a-button size="small" style="font-weight:900;" class="infoButton" type="primary">i</a-button>
            </a-popover>
          </h4>
        </a-col>
        <a-col :span="4">
          <h4 style="font-weight: 900;">Collateral/Ratio</h4>
        </a-col>
        <a-col :span="3">
          <h4 style="font-weight: 900;">CDP Value</h4>
        </a-col>
        <a-col :span="3">
          <h4 style="font-weight: 900;">Discount</h4>
        </a-col>
        <a-col :span="4">
          <h4 class="PinkText" style="font-weight: 900;">
            Final Value
            <a-popover title="Final Value">
              <template
                slot="content"
              >The final calculated value of the CDP considering the underlying collateral, debt drawn, stability fee outstanding and discount.</template>
              <a-button size="small" style="font-weight:900;" class="infoButton" type="primary">i</a-button>
            </a-popover>
          </h4>
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
          <a-col style="padding-top:5px" :span="3">
            <a :href="'https://mkr.tools/cdp/'+ cdp.CDPNo" target="_blank">
              <h4
                style="padding-left:15px;   text-decoration: underline;"
              >{{numberWithCommas(cdp.CDPNo)}}</h4>
            </a>
          </a-col>
          <a-col style="padding-top:5px" :span="3">
            <h4>{{numberWithCommas(cdp.daiDrawn)}} DAI</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="4">
            <h4>{{cdp.collateralRatio}}</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="3">
            <h4>{{numberWithCommas(cdp.value)}} ETH</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="3">
            <h4>{{cdp.discount}} %</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="4">
            <h4 class="PinkText">{{cdp.finalPrice}} ETH</h4>
          </a-col>
          <a-col :span="3">
            <a-button class="BuyButton" @click="showModal(cdp.debtId)" type="primary">Buy</a-button>
          </a-col>
        </a-row>
        <hr style="padding:0px; margin:0px" />
      </div>
      <div style="padding-bottom:25px" />
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
          <a-button key="submit" class="BuyButton" type="primary" @click="buyCDP">Buy</a-button>
        </div>
      </template>
      <h2 style="padding-bottom:25px">Buy CDP</h2>
      <a-row>
        <a-col :span="3">
          <h4 style="font-weight: 900; padding-left:15px">CDP #</h4>
        </a-col>
        <a-col :span="3">
          <h4 style="font-weight: 900;">
            Total Debt
            <a-popover title="Total Debt">
              <template
                slot="content"
              >The total debt on the CDP. This is the total DAI drawn + all fees incurred over the duration of the CDP's lifespan.</template>
              <a-button size="small" style="font-weight:900;" class="infoButton" type="primary">i</a-button>
            </a-popover>
          </h4>
        </a-col>
        <a-col :span="4">
          <h4 style="font-weight: 900;">Collateral/Ratio</h4>
        </a-col>
        <a-col :span="3">
          <h4 style="font-weight: 900;">CDP Value</h4>
        </a-col>
        <a-col :span="3">
          <h4 style="font-weight: 900;">Discount</h4>
        </a-col>
        <a-col :span="4">
          <h4 class="PinkText" style="font-weight: 900;">
            Final Value
            <a-popover title="Final Value">
              <template
                slot="content"
              >The final calculated value of the CDP considering the underlying collateral, debt drawn, stability fee outstanding and discount.</template>
              <a-button size="small" style="font-weight:900;" class="infoButton" type="primary">i</a-button>
            </a-popover>
          </h4>
        </a-col>
        <a-col :span="3">
          <h4 style="font-weight: 900;"></h4>
        </a-col>
      </a-row>
      <hr />
      <div>
        <a-row style="padding-top:15px; padding-bottom:15px;">
          <a-col style="padding-top:5px" :span="3">
            <a :href="'https://mkr.tools/cdp/'+ cdpInfo[selectedCDP].CDPNo" target="_blank">
              <h4
                style="padding-left:15px;   text-decoration: underline;"
              >{{numberWithCommas(cdpInfo[selectedCDP].CDPNo)}}</h4>
            </a>
          </a-col>
          <a-col style="padding-top:5px" :span="3">
            <h4>{{numberWithCommas(cdpInfo[selectedCDP].daiDrawn)}} DAI</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="4">
            <h4>{{cdpInfo[selectedCDP].collateralRatio}}</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="3">
            <h4>{{numberWithCommas(cdpInfo[selectedCDP].value)}} ETH</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="3">
            <h4>{{cdpInfo[selectedCDP].discount}} %</h4>
          </a-col>
          <a-col style="padding-top:5px" :span="4">
            <h4 class="PinkText">{{cdpInfo[selectedCDP].finalPrice}} ETH</h4>
          </a-col>
          <a-col :span="3">
            <a-button
              class="BuyButton"
              @click="showModal(cdpInfo[selectedCDP].debtId)"
              type="primary"
            >Buy</a-button>
          </a-col>
        </a-row>
        <hr style="padding:0px; margin:0px" />
      </div>
      <div style="padding-bottom:25px" />
      <p>This will transfer the CDP into your ownership in exchange for the total value of the CDP listed above. You will be able to manage the CDP through the standard MakerDao dashboard after the transfer.</p>
    </a-modal>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";
export default {
  name: "BuyCDP",
  methods: {
    ...mapActions(["BUY_CDP"]),
    buyCDP() {
      this.BUY_CDP(this.selectedCDP);
    },
    showModal(cdpId) {
      console.log(cdpId);
      this.selectedCDP = cdpId;
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
    },
    numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
  },
  data() {
    return {
      selectedCDP: 0,
      visible: false,
      cdpInfo: [
        {
          debtId: 0,
          CDPNo: 14960,
          daiDrawn: 151151,
          collateralRatio: "1411.76 ETH | 166.23%",
          fee: 901,
          value: 522.632,
          discount: 2,
          finalPrice: 512.172,
          selected: false
        },
        {
          debtId: 1,
          CDPNo: 132973,
          daiDrawn: 1785,
          collateralRatio: "21.03 ETH | 209%",
          fee: 0.34,
          value: 10.532,
          discount: 6,
          finalPrice: 9.799,
          selected: false
        },
        {
          debtId: 2,
          CDPNo: 14908,
          daiDrawn: 618.16,
          collateralRatio: "5.69 ETH | 163.69%",
          fee: 2.83,
          value: 2.052,
          discount: 9,
          finalPrice: 1.883,
          selected: false
        },
        {
          debtId: 3,
          CDPNo: 1040,
          daiDrawn: 1800.95,
          collateralRatio: "18.3 ETH | 178.14%",
          fee: 6.7,
          value: 7.712,
          discount: 1,
          finalPrice: 7.632,
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
  margin: 50px;
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

.infoButton {
  background: #ff95cd;
  border: green;
  width: 25px;
  border-radius: 20px;
  font-weight: 900;
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

