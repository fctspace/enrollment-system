<template>
  <div class="login">
    <div
      style="position: relative;z-index: 10;height: calc(100vh - 16pt - 49px);overflow: auto;"
    >
      <div class="login-header">
        <div
          :class="[isReg ? 'isReg' : '', 'isleft']"
          @click="changeIsReg(true)"
        >
          报名注册
        </div>
        <div
          :class="[!isReg ? 'isReg' : '', 'isright']"
          @click="changeIsReg(false)"
        >
          绑定登录
        </div>
      </div>
      <div class="login-title">选身份</div>
      <div class="login-img">
        <van-radio-group v-model="from.loginType" direction="horizontal">
          <div
            class="login-img-title"
            style="margin-right: 32pt;"
            @click="changeInfoType(true)"
          >
            <van-image
              v-show="changeInfoTypeStatus"
              round
              width="70"
              height="70"
              :src="imgList.student1"
            />
            <van-image
              v-show="!changeInfoTypeStatus"
              round
              width="70"
              height="70"
              :src="imgList.student0"
            />
            <div class="login-img-name">报名学生</div>
            <van-image
              round
              width="20"
              height="20"
              :src="imgList.activeU"
              class="login-icon-n"
              v-show="changeInfoTypeStatus"
            />
          </div>
          <div class="login-img-title" @click="changeInfoType(false)">
            <van-image
              v-show="changeInfoTypeStatus"
              round
              width="70"
              height="70"
              :src="imgList.parant0"
            />
            <van-image
              v-show="!changeInfoTypeStatus"
              round
              width="70"
              height="70"
              :src="imgList.parant1"
            />
            <div class="login-img-name">报名家长</div>
            <van-image
              round
              width="20"
              height="20"
              :src="imgList.activeU"
              class="login-icon-n"
              v-show="!changeInfoTypeStatus"
            />
          </div>
        </van-radio-group>
      </div>
      <div v-show="isReg" class="login-data">
        <van-form>
          <van-field
            v-model="recruitSchoolName"
            label="招生学校"
            @click="isHasCode ? (showPicker = false) : (showPicker = true)"
            placeholder="请选择招生学校"
            disabled
            :right-icon="showPicker ? 'arrow-down' : 'arrow'"
          >
          </van-field>
          <van-field
            v-model="sourceSchoolName"
            label="所属学校"
            @click="sourceSchoolShowPicker = true"
            placeholder="请选择所属学校"
            disabled
            :right-icon="sourceSchoolShowPicker ? 'arrow-down' : 'arrow'"
          >
          </van-field>
          <van-field
            v-model="className"
            label="所属班级"
            @click="classShowPicker = true"
            placeholder="请选择所属班级"
            disabled
            :right-icon="classShowPicker ? 'arrow-down' : 'arrow'"
          >
          </van-field>
          <van-field
            v-model.trim="from.studentName"
            label="学生姓名"
            @focus="inputFunc"
            label-class="xx"
            @blur="blur"
            placeholder="填写学生姓名"
            maxLength="4"
          />
          <van-field
            v-model="from.parentTelephone"
            label="家长手机"
            label-class="xx"
            @focus="inputFunc"
            :readonly="isCode"
            @blur="blur"
            type="tel"
            placeholder="请填写家长手机"
            maxLength="11"
          />
          <van-field
            v-model.trim="from.verifyCode"
            label="验证码"
            @focus="inputFunc"
            @blur="blur"
            type="number"
            placeholder="填写验证码"
            maxLength="4"
          >
            <template #button>
              <van-button
                size="small"
                :disabled="isCode"
                color="#fff"
                @click="sendCode"
                >{{ codeText }}</van-button
              >
            </template>
          </van-field>
        </van-form>
      </div>
      <div v-show="!isReg" class="login-data">
        <van-form>
          <van-field
            v-model="bindStudentQuery.studentName"
            label="学生姓名"
            @focus="inputFunc"
            @blur="blur"
            label-class="xx"
            placeholder="填写学生姓名"
            maxLength="4"
          />
          <van-field
            v-model="bindStudentQuery.parentTelephone"
            label="家长手机"
            label-class="xx"
            @focus="inputFunc"
            @blur="blur"
            type="tel"
            placeholder="填写手机号码"
            maxLength="11"
          />
        </van-form>
      </div>
    </div>
    <div class="info-button">
      <van-button
        :color="isLoading ? '#B5F0FF' : '#00CCFF'"
        block
        @click="go"
        :loading="isLoading"
        loading-text="进行中..."
        >下一步</van-button
      >
    </div>
    <van-popup v-model="showPicker" position="bottom">
      <van-picker
        show-toolbar
        value-key="recruitSchoolName"
        :columns="recruitSchoolList"
        @cancel="showPicker = false"
        @confirm="onConfirm"
      />
    </van-popup>
    <van-popup v-model="sourceSchoolShowPicker" position="bottom">
      <van-picker
        show-toolbar
        value-key="sourceSchoolName"
        :columns="sourceSchoolIdList"
        @cancel="sourceSchoolShowPicker = false"
        @confirm="sourceSchoolonConfirm"
      />
    </van-popup>
    <van-popup v-model="classShowPicker" position="bottom">
      <van-picker
        show-toolbar
        value-key="className"
        :columns="classList"
        @cancel="classShowPicker = false"
        @confirm="classConfirm"
      />
    </van-popup>
    <van-dialog
      v-model="show"
      :closeOnClickOverlay="true"
      :title="schoolClassNameTitle"
      show-cancel-button
      confirm-button-text="绑定"
      :confirm="schoolClassNameBD"
      cancel-button-text="新注册"
      :beforeClose="beforeClose"
      :cancel="schoolClassNameXZC"
    >
      <div>
        <van-field
          label="所属学校"
          readonly
          v-model="schoolClassNameData.sourceSchoolName"
          placeholder="请输入所属学校"
        />
        <van-field
          label="所属班级"
          readonly
          v-model="schoolClassNameData.className"
          placeholder="请输入所属班级"
        />
        <van-field
          label="学生姓名"
          readonly
          v-model="schoolClassNameData.studentName"
          placeholder="请输入学生姓名"
          maxLength="4"
        />
        <van-field
          label="注册手机"
          readonly
          v-model="schoolClassNameData.parentTelephone"
          placeholder="请输入注册手机"
        />
      </div>
      <div>
        <van-notice-bar text="如需绑定请输入注册手机号进行验证" />
        <van-field
          label="绑定手机"
          v-model="schoolClassNameDataPhone"
          placeholder="请输入绑定手机"
        />
      </div>
    </van-dialog>
  </div>
</template>

<script>
import {
  Image,
  Field,
  Button,
  Picker,
  Popup,
  Form,
  RadioGroup,
  Dialog,
  NoticeBar
} from "vant";
import {
  listRecruitSchool,
  listSourceSchoolByRecruit,
  listClassBySource,
  register,
  login,
  registerBind,
  registerNewStudent,
  bindStudent,
  checkStudentAndPhone,
  getMsgCode
} from "@/api/login/login";
import { phone } from "@/assets/rules/rulesFrom";
import { mapMutations } from "vuex";
export default {
  components: {
    vanImage: Image,
    vanField: Field,
    vanButton: Button,
    vanPicker: Picker,
    vanPopup: Popup,
    vanRadioGroup: RadioGroup,
    vanForm: Form,
    vanNoticeBar: NoticeBar,
    [Dialog.Component.name]: Dialog.Component
  },
  name: "login",
  data() {
    return {
      imgList: {
        student0: require("../../assets/image/student0.png"),
        student1: require("../../assets/image/student1.png"),
        parant0: require("../../assets/image/parant0.png"),
        parant1: require("../../assets/image/parant1.png"),
        activeU: require("../../assets/image/success.png")
      },
      changeInfoTypeStatus: true,
      isLoading: false,
      timer: null,
      codeText: "发送验证码",
      isHasCode: false, //是否是扫描负责人二维码登录
      isReg: true,
      show: false,
      top: 0,
      value: "",
      showPicker: false,
      recruitSchoolList: [], //招生学校列表
      recruitSchoolName: "", //选中的招生学校名称
      sourceSchoolIdList: [], //生源学校列表
      sourceSchoolName: "", //选中的生源学校名次
      sourceSchoolShowPicker: false,
      classList: [], //班级列表
      className: "", //班级名称
      classShowPicker: false,
      loginFrom: {
        code: "",
        preachPlanId: "",
        recruitSchoolId: ""
      },
      from: {
        classId: 1, // 班级ID
        openid: "", // openid
        loginType: 0, // 登录类型（0：学生，1：家长
        parentTelephone: "", // 联系方式
        preachPlanId: "", // 招生宣讲计划ID
        recruitSchoolId: 0, // 招生学校ID
        sourceSchoolId: 0, // 生源学校ID
        studentName: "", // 学生姓名
        verifyCode: "" // 验证码
      },
      //绑定时的数据
      bindStudentQuery: {
        loginType: 0, // 登录类型（0：学生，1：家长
        openid: "", // openid
        studentName: "", // 学生姓名
        parentTelephone: "" // 联系方式
      },
      //注册时学校班级姓名相同，手机号不同的时触发
      schoolClassNameData: {},
      schoolClassNameDataPhone: "", //绑定是的手机号
      schoolClassNameTitle: "", //标题
      isCode: false
    };
  },
  methods: {
    ...mapMutations(["setUser"]),
    //修改注册类型
    changeInfoType(status) {
      this.changeInfoTypeStatus = status;
      this.from.loginType = Number(!status);
      this.bindStudentQuery.loginType = Number(!status);
      console.log(this.from.loginType, this.bindStudentQuery.loginType);
    },
    //发送验证码
    sendCode() {
      console.log(this.from.parentTelephone);
      if (!phone.rules.test(this.from.parentTelephone)) {
        this.$toast("请输入正确手机号码");
        return;
      }
      this.isCode = true;
      getMsgCode(this.from.parentTelephone)
        .then(res => {
          this.isCode = true;
          this.setInter();
          console.log(res);
        })
        .catch(err => {
          this.isCode = false;
          console.log(err);
        });
    },
    setInter() {
      let timer = 60;
      this.timer = setInterval(() => {
        this.codeText = timer-- + "s";
        if (timer === 0) {
          clearInterval(this.timer);
          this.timer = null;
          this.codeText = "重发验证码";
          this.isCode = false;
        }
      }, 1000);
    },
    //选择报名注册还是绑定登录
    changeIsReg(statuts) {
      this.isReg = statuts;
    },
    //获取招生学校列表
    listRecruitSchool(status = true) {
      listRecruitSchool().then(res => {
        console.log(res);
        if (res.data && res.data.length) {
          this.recruitSchoolList = res.data;
          if (!status) {
            for (let i = 0; i < this.recruitSchoolList.length; i++) {
              if (
                this.from.recruitSchoolId ===
                this.recruitSchoolList[i].recruitSchoolId
              ) {
                this.recruitSchoolName = this.recruitSchoolList[
                  i
                ].recruitSchoolName;
                this.listSourceSchoolByRecruit(this.from.recruitSchoolId);
                break;
              }
            }
          } else {
            this.recruitSchoolName = res.data[0].recruitSchoolName;
            this.from.recruitSchoolId = res.data[0].recruitSchoolId;
            this.listSourceSchoolByRecruit(res.data[0].recruitSchoolId);
          }
        }
      });
    },
    //根据招生学校获取对应的生源学校
    listSourceSchoolByRecruit(id) {
      listSourceSchoolByRecruit(id).then(res => {
        console.log(res, "生源学校");
        if (res.data && res.data.length) {
          this.sourceSchoolIdList = res.data;
          this.sourceSchoolName = res.data[0].sourceSchoolName;
          this.from.sourceSchoolId = res.data[0].sourceSchoolId;
          this.listClassBySource(
            res.data[0].sourceSchoolId,
            this.from.recruitSchoolId
          );
        } else {
          this.sourceSchoolName = "";
          this.from.sourceSchoolId = "";
          this.sourceSchoolIdList = [];
          this.classList = [];
          this.className = "";
          this.from.classId = "";
        }
      });
    },
    //根据学校获取对应的班级信息
    listClassBySource(sourceSchoolId, recruitSchoolId) {
      listClassBySource({ sourceSchoolId, recruitSchoolId }).then(res => {
        console.log(res, "班级信息");
        if (res.data && res.data.length) {
          this.className = res.data[0].className;
          this.from.classId = res.data[0].classId;
          this.classList = res.data;
        } else {
          this.className = "";
          this.from.classId = "";
          this.classList = [];
        }
      });
    },
    //学生学校班级姓名一致，手机号不一致，前置拦截
    beforeClose(action, done) {
      console.log(action);
      //如果是绑定
      if (action === "confirm") {
        if (!this.schoolClassNameDataPhone) {
          this.$toast("新输入注册手机号");
          done(false);
          return;
        }
        this.schoolClassNameBD(done);
      } else if (action === "cancel") {
        this.schoolClassNameXZC(done);
      } else {
        done();
      }
    },
    //学生学校班级姓名一致，手机号不一至，点击绑定
    schoolClassNameBD(done) {
      let data = { ...this.schoolClassNameData };
      data.parentTelephone = this.schoolClassNameDataPhone;
      data.openid = this.from.openid;
      data.loginType = this.from.loginType;
      console.log("绑定", data);
      registerBind(data)
        .then(res => {
          done();
          //拿到Token直接跳首页
          this.setUser(res.data);
          this.WXConfig.wxShowMenu();
          this.$router.push({
            path: "/"
          });
          console.log(res);
        })
        .catch(() => {
          done(false);
        });
    },
    //学生学校班级手机号一致，弹出提示
    showT(message) {
      Dialog.confirm({
        title: "温馨提示",
        message: message
      })
        .then(() => {
          registerNewStudent(this.from).then(res => {
            console.log(res, "学生学校班级手机号一致，弹出提示");
            this.setUser(res.data);
            this.WXConfig.wxShowMenu();
            this.$router.push({
              path: "/signList/backups",
              query: { status: true }
            });
          });
        })
        .catch(() => {
          // on cancel
        });
    },
    //已存在一样的学生学校班级姓名手机号，弹出
    showT2(message) {
      Dialog.confirm({
        title: "温馨提示",
        message: message
      })
        .then(() => {
          console.log(this.from, "已存在一样的学生学校班级姓名手机号，弹出");
          bindStudent(this.from).then(res => {
            console.log(res, "已存在一样的学生学校班级姓名手机号，弹出");
            this.setUser(res.data);
            this.WXConfig.wxShowMenu();
            this.$router.push({
              path: "/"
            });
          });
        })
        .catch(() => {
          // on cancel
        });
    },
    showT3(message) {
      Dialog.confirm({
        title: "温馨提示",
        message: message
      })
        .then(() => {
          bindStudent(this.bindStudentQuery).then(res => {
            this.setUser(res.data);
            this.WXConfig.wxShowMenu();
            this.$router.push({
              path: "/"
            });
          });
        })
        .catch(() => {
          // on cancel
        });
    },
    //学生学校班级姓名一致，手机号不一至，点击新注册
    schoolClassNameXZC(done) {
      console.log("新注册");
      registerNewStudent(this.from)
        .then(res => {
          console.log(res, "新注册");
          this.setUser(res.data);
          this.WXConfig.wxShowMenu();
          this.$router.push({
            path: "/signList/backups",
            query: { status: true }
          });
          done();
        })
        .catch(err => {
          console.log(err);
          done(false);
        });
    },
    //绑定学生操作
    bindStudent() {
      this.bindStudentQuery.openid = this.from.openid;
      this.bindStudentQuery.loginType = this.from.loginType;
      console.log(this.bindStudentQuery, "绑定学生操作");
      checkStudentAndPhone(this.bindStudentQuery)
        .then(res => {
          console.log(res);
          this.isLoading = false;
          this.showT3("将会绑定已注册的帐号，是否绑定");
        })
        .catch(() => {
          this.isLoading = false;
        });
    },
    //输入框聚焦事件
    inputFunc() {
      console.log(1);
      // this.top = -100
    },
    //输入框失去聚焦
    blur() {
      // this.top = 0
    },

    //下一步
    go() {
      if (this.isLoading) {
        return;
      }
      if (this.isReg) {
        if (!this.from.studentName) {
          this.$toast("请输入学生姓名");
          return;
        }
        if (!phone.rules.test(this.from.parentTelephone)) {
          this.$toast("请输入正确手机号码");
          return;
        }
        if (!this.from.verifyCode) {
          this.$toast("请输入验证码");
          return;
        }
        this.register();
      } else {
        if (!this.bindStudentQuery.studentName) {
          this.$toast("请输入学生姓名");
          return;
        }
        if (!phone.rules.test(this.bindStudentQuery.parentTelephone)) {
          this.$toast("请输入正确手机号码");
          return;
        }
        this.bindStudent();
      }
      this.isLoading = true;
    },
    //注册操作
    register() {
      register(this.from)
        .then(res => {
          this.isLoading = false;
          this.setUser(res.data);
          this.WXConfig.wxShowMenu();
          this.$router.push({
            path: "/signList/backups",
            query: { status: true }
          });
        })
        .catch(err => {
          this.isLoading = false;
          console.log(err);
          //注册时学校班级姓名相同，手机号不同的时触发
          if (err.data.retCode === 600006) {
            this.show = true;
            this.schoolClassNameTitle = err.data.message;
            this.schoolClassNameData = err.data.data;
            console.log(err.data);
          } else if (err.data.retCode === 600007) {
            //注册时学校班级手机号相同，姓名不同的时触发
            this.showT(err.data.message);
          } else if (err.data.retCode === 600011) {
            this.showT2(err.data.message);
          }
        });
    },
    //选择学校
    changeSchool() {
      console.log(1);
      this.showPicker = true;
    },
    //招生学校确认选择
    onConfirm(item) {
      console.log(item);
      this.from.recruitSchoolId = item.recruitSchoolId;
      this.recruitSchoolName = item.recruitSchoolName;
      this.listSourceSchoolByRecruit(item.recruitSchoolId);
      this.showPicker = false;
    },
    //所属学校确认选择
    sourceSchoolonConfirm(item) {
      console.log(item);
      this.sourceSchoolName = item.sourceSchoolName;
      this.from.sourceSchoolId = item.sourceSchoolId;
      this.listClassBySource(item.sourceSchoolId, this.from.recruitSchoolId);
      this.sourceSchoolShowPicker = false;
    },
    //所属班级确认
    classConfirm(item) {
      this.className = item.className;
      this.from.classId = item.classId;
      this.classShowPicker = false;
    },
    //登录
    login(data) {
      login(data)
        .then(res => {
          this.setUser(res.data);
          this.WXConfig.wxShowMenu();
          setTimeout(() => {
            this.$router.push({
              path: "/"
            });
          }, 200);
        })
        .catch(err => {
          console.log(err);
          if (err.data.retCode === 600019) {
            this.$router.push({
              path: "/LoginActive",
              query: {
                data: JSON.stringify(err.data.data)
              }
            });
            return;
          }
          let query = this.$route.query;
          let status = true
          if (query.recruitSchoolId) {
            this.isHasCode = true;
            this.from.recruitSchoolId = query.recruitSchoolId;
            status = false
          }
          if (err.data.retCode === 600002) {
            this.from.openid = err.data.data;
            this.listRecruitSchool(status);
          } else {
            this.listRecruitSchool(status);
          }
        });
    }
  },
  created() {
    let token = localStorage.getItem("token");
    let math = localStorage.getItem("mathNumber");
    let query = this.$route.query;
    if (math !== query.math) {
      this.loginFrom.code = query.code;
      localStorage.setItem("mathNumber", query.math);
      this.loginFrom.recruitSchoolId = query.recruitSchoolId;
      this.login(this.loginFrom);
      return;
    }
    if (!token) {
      this.loginFrom.code = query.code;
      localStorage.setItem("mathNumber", query.math);
      this.loginFrom.recruitSchoolId = query.recruitSchoolId;
      this.login(this.loginFrom);
    } else {
      this.$router.push({
        path: "/signList/backups",
        query: { status: true }
      });
    }
  },
  beforeRouteLeave(to, from, next) {
    if(this.showPicker || this.sourceSchoolShowPicker || this.classShowPicker) {
      this.showPicker = false;
      this.sourceSchoolShowPicker = false;
      this.classShowPicker = false;
      next(false);
    }else {
      next();
    }
  },
  beforeDestroy() {
    this.timer && clearInterval(this.timer);
    this.timer = null;
  }
};
</script>

<style scoped lang="stylus">
.login
    font-size fontMedSize
    padding-top 16pt
    background-color bgColor
    height calc( 100vh  - 16pt )
    .login-header
      display flex
      justify-content: space-around
      margin-bottom: 25pt
      >div
        color fontNotActiveColor
        padding: 10px 30px;
        border-radius: 20px;
        flex 1
        border 1px solid notActiveBtnColor
        text-align center
        background-color notActiveBtnColor
        position relative
      .isleft
        left 15px
      .isright
        right 15px
      .isReg
        background-color btnBgColor
        color bgColor
        z-index 9
    .login-title
        color fontTitleColor
        font-size 16px
        font-weight bold
        margin-left: 16pt;
        position: relative;
        top: 16px;
    .login-data
        border-bottom 1px solid #eee
        margin-top: 32pt;
        >>>.van-cell
              padding-left: 16pt
              padding-right: 16pt
              font-size 15px
              display: flex;
              align-items: center;
              height: inputLineHeight
              span
                font-weight bold
        >>>.van-button--default
              color activeBtnColor !important
              font-size 15px
              padding: 0;
              text-align: right;
              span
                font-weight normal
        >>>.van-field__control:disabled
              color: #333333;
        >>>.van-icon-arrow
              font-size: 10px;
              transform: scale(1);
        >>>.van-icon-arrow-down
              font-size: 10px;
              transform: scale(1);
         >>>.xx
              >span
                 position relative
                 &:after
                   position: absolute;
                   right: -10px;
                   color: #ee0a24;
                   font-size: 0.37333rem;
                   content: '*';
         >>>.van-cell:not(:last-child)::after
              left 0px
    .login-img
        display flex;
        justify-content space-around
        text-align center
        .login-img-title
            position relative
            .login-img-name
                margin-top 10px
                color fontTitleColor
            .login-icon-n
              position: absolute;
              right: -5px;
              bottom: 30px;
    .info
        margin-top 68px
        margin-bottom 30px
        .info-btn
            color bgColor
    .info-button
      position: absolute;
      width: 100%;
      bottom: 0;
      height: 49px;
      z-index: 8;
      >>>button
        height: 49px;
        >span
          font-weight bold
          position relative
          top 1px
          font-size: 18px;
</style>
