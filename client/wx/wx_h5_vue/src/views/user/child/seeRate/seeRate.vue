<template>
  <div>
    <h5-header :leftStatus="true" title="进度查看"></h5-header>
    <div class="item">
      <van-steps direction="vertical" :active="active">
        <van-step v-for="(item,index) in list" :key="item + index">
          <h3 :class="index <= active ? 'isColor': 'notColor'">{{ item }}</h3>
          <p v-show="item2.progressType === index" :class="index <= active ? 'isColorMin': ''" v-for="(item2,index1) in data" :key="item2.progressContent + index1">{{item2.createTime +' '+item2.progressContent}}</p>
        </van-step>
      </van-steps>
    </div>
  </div>
</template>

<script>
import { Step, Steps } from "vant";
import Header from "@/components/cheader";
import { queryProgressInfo } from "@/api/user/user";
export default {
  name: "seeRate",
  components: {
    vanStep: Step,
    vanSteps: Steps,
    h5Header: Header
  },
  data() {
    return {
      active: 0,
      list: ["报名登记", "交费定位", "接收通知", "入学报名"],
      data:[]
    };
  },
  methods: {
    queryProgressInfo() {
      queryProgressInfo().then(res => {
        if(res.data.length) {
          this.data = res.data;
          this.active = res.data[res.data.length - 1].progressType
        }
      });
    }
  },
  created() {
    this.queryProgressInfo();
  }
};
</script>

<style scoped lang="stylus">
.item
  padding-left: 24px;
  background-color: #fff;
  padding-top: 50px;
  .isColor
    color btnBgColor
    position relative
    left 8px
  .notColor
    position relative
    left 8px
  .isColorMin
    color btnBgColor
    margin-top 15px
    margin-bottom 20px
  >>>.van-step__icon--active
        color: #00ccff;
  >>>.van-icon
        font-size 20px
  >>>.van-step__title--active
        color: #00ccff;
  >>>.van-step--finish > .van-step__line
        background-color: #0cf
  >>>.van-step--finish .van-step__circle
        background-color: #0cf
</style>
