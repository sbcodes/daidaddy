import Vue from "vue";
import {
  Button,
  Row,
  Col,
  Modal,
  Radio
} from "ant-design-vue";
import "ant-design-vue/dist/antd.css";

import App from "./App.vue";
import router from "./router";
import store from "./store";
import "./registerServiceWorker";
import MessageBubble from "./components/MessageBubble";
import Messages from "./components/Messages";
import Logo from "./components/Logo";
import Nav from "./components/Nav";
import Hero from "./components/Hero";

Vue.component(Button.name, Button);
Vue.component(Row.name, Row);
Vue.component(Col.name, Col);
Vue.component(Button.name, Button);
Vue.component(MessageBubble.name, MessageBubble);
Vue.component(Logo.name, Logo);
Vue.component(Nav.name, Nav);
Vue.component(Messages.name, Messages);
Vue.component(Hero.name, Hero);
Vue.component(Modal.name, Modal)
Vue.component(Radio.name, Radio)

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");