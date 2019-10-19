<template>
    <a-row class="container" type="flex" align="center">
        <a-col :span="12">
            <h2 class="title">Sell your CDP</h2>
            <p class="subtitle">
                DAI daddy is an autonomous, open-source platform for buying and selling collateralised debt positions
            </p>
            <a-row class="container" type="flex" align="center">
                <a-col :span="12">
                    <a-button>Sell</a-button>
                </a-col>
                <a-col :span="12">
                    <a-button>Buy</a-button>
                </a-col>
            </a-row>
        </a-col>
        <a-col :span="12">
            <a-row class="container" type="flex" align="center">
                <a-col :span="12">
                </a-col>
                <a-col :span="12">
                </a-col>
            </a-row>
        </a-col>
    </a-row>
</template>

<script>
export default {
  name: "SellYourCDP"
};
</script>

<style scoped lang="scss">
    .container {
        padding: 20px 80px;
        box-sizing: border-box;
        align-items: center;
        text-align: left;
    }

    .title {
        font-weight: 600;
        font-size: 50px;
        line-height: 68px;
        color: #1B0E33;
        padding: 0 60px;
    }

    .subtitle {
        font-size: 25px;
        line-height: 34px;
        color: #1B0E33;
        padding: 0 60px;
    }

</style>