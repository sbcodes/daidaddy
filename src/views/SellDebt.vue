<template>
  <div class="home">
    <ListCDPs/>
  </div>
</template>

<script>
// @ is an alias to /src
import ListCDPs from '@/components/ListCDPs.vue'

export default {
  name: 'home',
  components: {
    ListCDPs
  }
}
</script>
