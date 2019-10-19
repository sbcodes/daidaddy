import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './registerServiceWorker'
import Button from 'ant-design-vue/lib/button';
import MessageBubble from './components/MessageBubble';
import 'ant-design-vue/dist/antd.css';

Vue.component(Button.name, Button);
Vue.component(MessageBubble.name, MessageBubble);

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
