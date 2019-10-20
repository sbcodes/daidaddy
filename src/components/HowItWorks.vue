<template>
    <div class="container">
        <h2 class="howitworksh">
            How it works
        </h2>
        <a-row type="flex" align="center">
            <a-col :span="12">
                <img src="img/sellMichael.png" class="hiw-michael">
            </a-col>
            <a-col :span="12">
                <img src="img/buyMichael.png" class="hiw-michael">
            </a-col>
        </a-row>
        <br />
        <br />
        <a-row type="flex" align="center" justify="center" :gutter="64">
            <a-col :span="12" class="btn-container">
                <router-link class="pink-button ant-btn ant-btn-primary ant-btn-block ant-btn-lg" to="/listing?open=true">Sell</router-link>
            </a-col>
            <a-col :span="12" class="btn-container">
                <router-link class="pink-button ant-btn ant-btn-primary ant-btn-block ant-btn-lg" to="/buy">Buy</router-link>
            </a-col>
        </a-row>

    </div>
</template>

<script>
export default {
  name: "HowItWorks"
};
</script>

<style scoped lang="scss">
    .container {
        padding: 80px;
        box-sizing: border-box;
        align-items: center;
    }
    .howitworksh {
        font-weight: 600;
        font-size: 50px;
        line-height: 68px;
        color: #FF94CE;
        text-align: center;
    }
    .hiw-michael {
        max-width: 80%;
        height: auto;
        object-fit: contain;
        z-index: -1;
    }
    .btn-container {
        display: flex;
        justify-content: center;
        max-width: 300px;
    }

</style>