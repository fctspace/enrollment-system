<template>
  <div class="student-more-info-edit">
    <h5-header :leftStatus="true" title="学生基础信息编辑"></h5-header>
    <div class="student-more-info-edit-content">
      <van-form @submit="onSubmit" ref="form">
        <!-- 基本信息 -->
        <div class="form-split-title">基本信息</div>
        <!-- 文件上传 -->
        <van-field name="form.uploader" label="照片">
          <template #input>
            <van-uploader
              :after-read="uploadImg"
              v-model="form.uploader"
              preview-image
              :max-count="1"
              :before-delete="deleteImg"
            >
              <img v-if="form.imageUrl" :src="form.imageUrl | imgUrlFilter" class="img" />
            </van-uploader>
          </template>
        </van-field>
        <!-- 所属学校 -->
        <van-field
          readonly
          clickable
          label-class="xx"
          :value="form.sourceSchoolName"
          label="所属学校"
          placeholder="选择学校"
          @click="schoolVisible = true"
          :rules="[{ required: true, message: '请选择学校' }]"
        />
        <van-popup v-model="schoolVisible" position="bottom">
          <van-picker
            show-toolbar
            value-key="sourceSchoolName"
            :columns="schoolpicker"
            @cancel="schoolVisible = false"
            @confirm="onSchool"
          />
        </van-popup>
        <!-- 所在班级 -->
        <van-field
          clickable
          readonly
          label-class="xx"
          v-model="form.className"
          name="所在班级"
          label="所在班级"
          placeholder="选择班级"
          @click="classVisible = true"
          :rules="[{ required: true, message: '请选择班级' }]"
        />
        <van-popup v-model="classVisible" position="bottom">
          <van-picker
            show-toolbar
            value-key="className"
            :columns="classpicker"
            @cancel="classVisible = false"
            @confirm="onClass"
          />
        </van-popup>
        <van-field
          label-class="xx"
          v-model="form.studentName"
          name="学生姓名"
          label="学生姓名"
          placeholder="请输入姓名"
          :rules="rules.title"
          maxlength="4"
        />
        <!-- 性别 -->
        <van-field
          clickable
          readonly
          v-model="genderPicker[form.gender]"
          name="性别"
          label="性别"
          placeholder="选择性别"
          label-class="xx"
          :rules="[{ required: true, message: '请选择性别' }]"
          @click="genderVisible = true"
        />
        <van-popup v-model="genderVisible" position="bottom">
          <van-picker
            value-key="nation"
            show-toolbar
            :columns="genderPicker"
            @cancel="genderVisible = false"
            @confirm="onGender"
          />
        </van-popup>
        <!-- <van-field name="radio" label="性别"> -->
        <!-- <template #input>
            <van-radio-group v-model="form.gender" direction="horizontal">
              <van-radio name="0" checked-color="#00CCFF">男</van-radio>
              <van-radio name="1" checked-color="#00CCFF">女</van-radio>
            </van-radio-group>
        </template>-->
        <!-- </van-field> -->

        <!-- 民族 -->
        <!-- <van-field v-model="form.nation" name="民族" label="民族" placeholder="请输入民族" /> -->
        <van-field
          clickable
          readonly
          v-model="form.nation"
          name="民族"
          label="民族"
          placeholder="选择民族"
          label-class="xx"
          :rules="[{ required: true, message: '请选择民族' }]"
          @click="nationVisible = true"
        />
        <!-- 民族弹框 -->
        <van-popup v-model="nationVisible" position="bottom">
          <van-picker
            value-key="nation"
            show-toolbar
            :columns="natiompicker"
            @cancel="nationVisible = false"
            @confirm="onnation"
          />
        </van-popup>
        <!-- 出生年月 -->
        <van-field
          clickable
          label-class="xx"
          readonly
          v-model="form.doa"
          label="出生时间"
          placeholder="选择年月日"
          :rules="[{ required: true, message: '请选择年月日' }]"
          @click="doaVisible = true"
        />
        <van-popup v-model="doaVisible" position="bottom">
          <van-datetime-picker
            show-toolbar
            v-model="currentDate"
            type="date"
            :formatter="formatter"
            @cancel="doaVisible = false"
            @confirm="onYear"
          />
        </van-popup>
        <van-field
          v-model="form.idNo"
          name="身份证号"
          label="身份证号"
          label-class="xx"
          :rules="rules.card"
          placeholder="请输入身份证号"
        />
        <!-- 健康状况 -->
        <van-field
          clickable
          readonly
          v-model="form.healthStatus"
          name="身体状况"
          label="身体状况"
          placeholder="选择身体状况"
          label-class="xx"
          @click="healthStatusVisible = true"
        />
        <van-field
          v-if="form.healthStatus == '其他'"
          placeholder="如果其他情况，请填写"
          input-align="right"
          maxlength="25"
          v-model="Hss"
        />
        <van-popup v-model="healthStatusVisible" position="bottom">
          <van-picker
            value-key="nation"
            show-toolbar
            :columns="healthStatusPicker"
            @cancel="healthStatusVisible = false"
            @confirm="onHealthStatus"
          />
        </van-popup>
        <!-- <van-field name="radio" label="身体状况">
          <template #input>
            <van-radio-group v-model="form.healthStatus" direction="horizontal">
              <van-radio name="健康" checked-color="#00CCFF">健康</van-radio>
              <van-radio name="2" checked-color="#00CCFF">其他</van-radio>
            </van-radio-group>
          </template>
        </van-field>-->
        <!-- 户籍所在地 -->
        <!-- <van-field v-model="form.address" name="户籍所在地" label="户籍所在地" placeholder="请输入户籍所在地" /> -->
        <van-field
          clickable
          label-class="xx"
          readonly
          v-model="adresses"
          label="户籍所在地"
          placeholder="选择户籍所在地"
          :rules="[{ required: true, message: '请选择户籍所在地' }]"
          @click="adressVisible = true"
        />
        <van-popup v-model="adressVisible" position="bottom">
          <van-area
            :area-list="areaList"
            :columns-placeholder="['请选择', '请选择', '请选择']"
            @cancel="adressVisible = false"
            @confirm="onAdress"
          />
        </van-popup>
        <!-- 联系方式 -->
        <div class="form-split-title">联系方式</div>
        <van-field
          v-model="form.wechat"
          name="学生微信"
          label="学生微信"
          :rules="rules.wechat"
          placeholder="请输入学生微信"
        />
        <van-field
          v-model="form.parentTelephone"
          :rules="rules.telephone"
          maxlength="11"
          label-class="xx"
          name="家长手机"
          label="家长手机"
          placeholder="请输入家长手机"
        />
        <van-field
          v-model="form.studentTelephone"
          name="学生手机"
          label="学生手机"
          placeholder="请输入学生手机"
          :rules="rules.isTelephone"
          maxlength="11"
        />
        <!-- 家庭住址 -->
        <van-field
          clickable
          label-class="xx"
          v-model="familyadresses"
          label="家庭住址"
          placeholder="选择家庭住址"
          @click="familyadressesVisible = true"
          readonly
          :rules="[{ required: true, message: '请选择家庭住址' }]"
        />
        <van-popup v-model="familyadressesVisible" position="bottom">
          <van-area
            :area-list="areaList"
            :columns-placeholder="['请选择', '请选择', '请选择']"
            @cancel="familyadressesVisible = false"
            @confirm="onfamilyadresses"
          />
        </van-popup>
        <van-field v-model="form.address" input-align="right" placeholder="街道、小区、门牌号" />
        <!-- 家庭信息 -->
        <div class="form-split-title">家庭信息</div>
        <!-- 关系 -->
        <van-field name="famRelation" label="关系" value="父亲" readonly>
          <!-- <template #input>
            <van-radio-group
              @change="isEquallyFam"
              v-model="familyform.relation"
              direction="horizontal"
            >
              <van-radio :name="0" checked-color="#00CCFF">父亲</van-radio>
              <van-radio :name="1" checked-color="#00CCFF">母亲</van-radio>
            </van-radio-group>
          </template>-->
        </van-field>
        <van-field
          v-model="familyform.name"
          name="家长姓名"
          maxlength="4"
          label="家长姓名"
          placeholder="请填写家长姓名"
        />
        <van-field
          v-model="familyform.telephone"
          name="手机号"
          maxlength="11"
          label="手机号"
          placeholder="联系方式"
          :rules="rules.isTelephone"
        />
        <van-field
          v-model="familyform.company"
          name="工作单位"
          maxlength="30"
          label="工作单位"
          placeholder="工作单位"
        />
        <van-field
          v-model="familyform.position"
          name="职务"
          maxlength="10"
          label="职务"
          placeholder="职务"
        />
        <van-field
          v-model="familyform.location"
          name="户籍所在地"
          maxlength="30"
          label="户籍所在地"
          readonly
          placeholder="请选择户籍所在地"
          @click="adressVisible1 = true"
        />
        <!-- <van-divider /> -->
        <van-popup v-model="adressVisible1" position="bottom">
          <van-area
            :area-list="areaList"
            :columns-placeholder="['请选择', '请选择', '请选择']"
            @cancel="adressVisible1 = false"
            @confirm="onAdress1"
          />
        </van-popup>
        <van-field name="famRelation" label="关系" value="母亲" readonly>
          <!-- <template #input>
            <van-radio-group
              @change="isEquallyFam"
              v-model="familyform1.relation"
              direction="horizontal"
            >
              <van-radio :name="0" checked-color="#00CCFF">父亲</van-radio>
              <van-radio :name="1" checked-color="#00CCFF">母亲</van-radio>
            </van-radio-group>
          </template>-->
        </van-field>
        <van-field
          v-model="familyform1.name"
          name="家长姓名"
          maxlength="4"
          label="家长姓名"
          placeholder="请填写家长姓名"
        />
        <van-field
          v-model="familyform1.telephone"
          name="手机号"
          label="手机号"
          maxlength="11"
          placeholder="联系方式"
          :rules="rules.isTelephone"
        />
        <van-field
          v-model="familyform1.company"
          name="工作单位"
          label="工作单位"
          maxlength="30"
          placeholder="工作单位"
        />
        <van-field
          v-model="familyform1.position"
          name="职务"
          label="职务"
          placeholder="职务"
          maxlength="10"
        />
        <van-field
          v-model="familyform1.location"
          name="户籍所在地"
          label="户籍所在地"
          maxlength="30"
          readonly
          placeholder="请选择户籍所在地"
          @click="adressVisible2 = true"
        />
        <van-popup v-model="adressVisible2" position="bottom">
          <van-area
            :area-list="areaList"
            :columns-placeholder="['请选择', '请选择', '请选择']"
            @cancel="adressVisible2 = false"
            @confirm="onAdress2"
          />
        </van-popup>
        <div class="student-target-add-save">
          <button class="action-save-btn" native-type="submit">保存</button>
        </div>
      </van-form>
    </div>
  </div>
</template>

<script>
import { dateFormat } from "@/utils/format";
import Header from "@/components/cheader";
import Vue from "vue";
import { Picker } from "vant";
import { DatetimePicker } from "vant";
import { Area } from "vant";
import { Divider } from "vant";
import rulesFrom from "@/assets/rules/rulesFrom";
import { Form, Field, Button, Uploader, RadioGroup, Radio, Popup } from "vant";
Vue.use(Form);
Vue.use(Field);
Vue.use(Button);
Vue.use(Uploader);
Vue.use(RadioGroup);
Vue.use(Radio);
Vue.use(Popup);
Vue.use(Picker);
Vue.use(DatetimePicker);
Vue.use(Area);
Vue.use(Divider);

import {
  listSourceSchoolPage,
  listClassPage,
  updateStudentInfo,
  queryStudentInfo
} from "../../../api/Student-info/Student-info";
import { uploadAdd } from "../../../api/Upload/upload";
import { sysnation } from "../../../api/Sys-nation/sys-nation";
import areaList from "@/assets/json/area";

export default {
  name: "student-more-info-edit",
  components: {
    h5Header: Header
  },
  data() {
    return {
      adressVisible1: false,
      adressVisible2: false,
      schoolVisible: false,
      classVisible: false,
      doaVisible: false,
      adressVisible: false,
      provinceVisible: false,
      cityVisible: false,
      districtVisible: false,
      genderVisible: false,
      healthStatusVisible: false,
      nationVisible: false,
      familyadressesVisible: false,
      currentDate: new Date(),
      schoolpicker: "",
      natiompicker: "",
      healthStatusPicker: ["健康", "其他"],
      genderPicker: ["男", "女"],
      classpicker: [],
      schoolName: "",
      adresses: "",
      familyadresses: "",
      adress: "",
      areaList: areaList,
      Hss: "",
      form: {},
      familyform: { relation: 0 },
      familyform1: { relation: 1 },
      query: {
        sourceSchoolId: "",
        pageNum: 1,
        pageSize: 100
      },
      stuId: null,
      rules: {
        title: [{ validator: this.isStudentName, message: "请输入1-10个字符" }],
        wechat: [{ validator: this.isWechat, message: "请输入正确微信号" }],
        isTelephone: [
          { validator: this.isTelephoneRule, message: "请输入正确手机号" }
        ],
        address: [
          {
            pattern: /^[0-9a-zA-Z\u4e00-\u9fa5]{2,50}$/,
            message: "请输入5-50个字符"
          }
        ],
        planAmount: [
          {
            pattern: /^\+?[1-9]\d*$/,
            message: "人数为大于0的整数"
          }
        ],
        telephone: [
          {
            pattern: rulesFrom.phone.rules,
            message: rulesFrom.phone.message
          }
        ],
        card: [
          {
            pattern: rulesFrom.card.rules,
            message: rulesFrom.card.message
          }
        ],
        famRelation: [
          {
            validator: this.famRelation,
            message: "不可选择相同的家庭信息关系！"
          }
        ]
      }
    };
  },
  created() {
    this.stuId = this.$route.params.id;
    //获取生源学校列表
    this.getSchoolPage();
  },
  methods: {
    //学校姓名校验
    isStudentName(val) {
      return val.length < 10 && val.length > 0;
    },
    //微信号验证
    isWechat(val) {
      if (!val) {
        return true;
      }
      let rules = /^[a-zA-Z]([-_a-zA-Z0-9]{5,20})$/;
      if (rules.test(val)) {
        return true;
      }
      return false;
    },
    //验证手机
    isTelephoneRule(val) {
      if (!val) {
        return true;
      }
      let rules = rulesFrom.phone.rules;
      if (rules.test(val)) {
        return true;
      }
      return false;
    },
    //验证家庭关系重复
    famRelation() {
      if (this.familyform1.relation == this.familyform.relation) {
        return false;
      }
      return true;
    },
    /**
     * 若选择其他家庭关系，两个关系不同时，则取消错误提示
     * @author lgh
     */
    isEquallyFam() {
      if (this.familyform1.relation != this.familyform.relation) {
        this.$refs.form.resetValidation("famRelation");
      }
    },
    /**
     * 保存
     * @param {obj} data  this.form
     * @author cwz
     */
    onSubmit() {
      if (this.form.healthStatus == "其他") {
        this.form.healthStatus = this.Hss;
      }
      this.familyform.studentInfo = this.form.studentInfo;
      this.familyform1.studentInfo = this.form.studentInfo;
      this.form.addFamilyMemberQueries = [
        { ...this.familyform },
        { ...this.familyform1 }
      ];
      console.log(this.form, this.familyform, this.familyform1);
      const data = { ...this.form };
      this.$message.loading("保存中...");
      updateStudentInfo(data)
        .then(() => {
          this.$message.close();
          this.$message.success(`保存成功`);
          this.$router.go(-1);
          //跳转到学生管理页面
          // this.$router.push({ path: "/student-manage/student-list" });
        })
        .catch(err => {
          console.error("保存失败：", err);
        });
    },
    /**
     * 根据名称获取ID
     * @param name{number} 获取的id所需要的名称
     * @param query{array} 需要获取的name对应的数组
     * @author LiuGuoHao
     */
    getIdByName(name, query) {
      console.log(name, query, "======");

      var obj = query.find(function(x) {
        return x.sourceSchoolName == name;
      });
      return obj.sourceSchoolId;
    },
    /**
     * 获取生源学校
     * @param
     * @author cwz
     */
    getSchoolPage() {
      this.$message.loading("正在加载学校数据...");
      listSourceSchoolPage()
        .then(res => {
          this.schoolpicker = res.data;
          //获取民族
          this.getnationPage();
          //获取基本信息
          this.queryStudentInfo();
          this.$message.close();
        })
        .catch(err => {
          console.error("加载失败：", err);
          this.$message.close();
        });
    },
    /**
     * 获取学生基本信息
     * @param
     * @author cwz
     */
    queryStudentInfo() {
      let data = this.stuId;
      this.$message.loading("正在加载学生数据...");
      queryStudentInfo(data)
        .then(res => {
          this.$message.close();
          this.form = res.data;
          this.form.gender = String(this.form.gender);
          if (this.form.province) {
            this.adresses =
              this.form.province + this.form.city + this.form.district;
          }
          if (this.form.familyProvince) {
            this.familyadresses =
              this.form.familyProvince +
              this.form.familyCity +
              this.form.familyDistrict;
          }
          // 存入家庭信息
          console.log(res.data.familyMembers.length, "?????");
          if (res.data.familyMembers.length) {
            if (res.data.familyMembers[0].relation == 0) {
              this.familyform = res.data.familyMembers[0];
            } else {
              this.familyform1 = res.data.familyMembers[0];
            }
            if (res.data.familyMembers[1].relation == 1) {
              this.familyform1 = res.data.familyMembers[1];
            } else {
              this.familyform = res.data.familyMembers[1];
            }
          } else {
            console.log("当前没有家庭信息");
          }
          // 对健康状况进行处理
          if (this.form.healthStatus != "健康") {
            this.Hss = this.form.healthStatus;
            this.form.healthStatus = "其他";
          }
          console.log(this.form.sourceSchoolName, 2222222);

          // 如果所属学校存在，则加载班级信息
          if (this.form.sourceSchoolName) {
            this.form.sourceSchoolId = this.getIdByName(
              this.form.sourceSchoolName,
              this.schoolpicker
            );
            this.getClassPage(false);
          }
        })
        .catch(err => {
          console.error("加载失败：", err);
        });
    },
    /**
     * 获取班级
     * @param query {} sourceSchoolId学校id
     * @param {boolean}isClick 判断是否为点击所属学校后获取所在班级
     * @author cwz
     */
    getClassPage(isClick) {
      this.query.sourceSchoolId = this.form.sourceSchoolId;
      if (this.query.sourceSchoolId.length != 0) {
        this.$message.loading("正在获取班级数据...");
        listClassPage(this.query).then(res => {
          this.$message.close();
          this.classpicker = res.data.records;
          if (isClick) {
            //判断获取的班级列表数据是否存在
            if (this.classpicker[0] != undefined) {
              //切换学校的同时切换默认选择第一个班级
              this.form.classId = res.data.records[0].classId;
              this.form.className = res.data.records[0].className;
            } else {
              this.form.classId = "";
              this.form.className = "";
            }
          }
        });
      }
    },
    /**
     * 获取民族
     * @param
     * @author cwz
     */
    getnationPage() {
      sysnation()
        .then(res => {
          this.natiompicker = res.data;
        })
        .catch(err => {
          console.error(err);
        });
    },
    /**
     * 图片上传
     * @author cwz
     */
    uploadImg(option) {
      this.uploadAdd(option.file, imgUrl => {
        console.log("imgUrl", imgUrl);
        console.log("option.file", option.file);
        this.form.imageUrl = imgUrl;
      });
    },
    /**
     * 上传图片接口
     * @param file {object} 二进制文件数据
     * @param callback{}
     * @author cwz
     */
    uploadAdd(file, callback) {
      let formData = new FormData();
      let type = file.name.substring(
        file.name.indexOf(".") + 1,
        file.name.length
      );
      formData.append("file", file);
      formData.append("fileType", type);
      uploadAdd(formData)
        .then(res => {
          callback(res.data);
        })
        .catch(err => {
          console.error(err);
        });
    },
    /**
     * 上传图片进行格式分析
     * @param file(String) 图片内容
     * @author cwz
     */
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg" || "image/png";
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG/PNG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },
    /**
     * 删除文件时的方法调用
     * @author lgh
     */
    deleteImg() {
      this.form.imageUrl = "";
      this.uploader = [];
      console.log(this.form.imageUrl, "==>imageUrl");

      return true;
    },
    /**
     * 学校弹框确定
     * @author cwz
     */
    onSchool(schoolName) {
      // this.sourceSchoolName = schoolName.sourceSchoolName;
      this.form.sourceSchoolId = schoolName.sourceSchoolId;
      this.form.sourceSchoolName = schoolName.sourceSchoolName;
      // this.schoolId = schoolName.sourceSchoolId;
      this.schoolVisible = false;
      this.getClassPage(true);
    },
    /**
     * 班级弹框确定
     * @author cwz
     */
    onClass(classes) {
      this.form.classId = classes.classId;
      this.form.className = classes.className;
      this.classVisible = false;
    },
    /**
     * 性别弹框确定
     * @author cwz
     */
    onGender(gender, index) {
      this.form.gender = index;
      this.genderVisible = false;
    },
    /**
     * 民族弹框确定
     * @author cwz
     */
    onnation(nation) {
      this.form.nation = nation.nation;
      this.nationVisible = false;
    },
    /**
     * 身体状况弹框确定
     * @author cwz
     */
    onHealthStatus(healthStatus) {
      this.form.healthStatus = healthStatus;
      this.healthStatusVisible = false;
    },
    /**
     * 出生年月日弹框确定
     * @author cwz
     */
    onYear(date) {
      this.form.doa = dateFormat(date, "YYYY-mm-dd");
      this.doaVisible = false;
    },
    /**
     * 户籍地址弹框确定
     * @author cwz
     */
    onAdress(adresses) {
      this.adresses = adresses[0].name + adresses[1].name + adresses[2].name;
      this.form.province = adresses[0].name;
      this.form.city = adresses[1].name;
      this.form.district = adresses[2].name;
      this.adressVisible = false;
    },
    /**
     * 户籍地址弹框确定
     * @author cwz
     */
    onAdress1(adresses) {
      console.log(adresses);
      this.adressVisible1 = false;
      let name = adresses[1].name ? "/" + adresses[1].name : adresses[1].name;
      let name2 = adresses[2].name ? "/" + adresses[2].name : adresses[2].name;
      this.familyform.location = adresses[0].name + name + name2;
    },
    /**
     * 户籍地址弹框确定
     * @author cwz
     */
    onAdress2(adresses) {
      console.log(adresses);
      this.adressVisible2 = false;
      let name = adresses[1].name ? "/" + adresses[1].name : adresses[1].name;
      let name2 = adresses[2].name ? "/" + adresses[2].name : adresses[2].name;
      this.familyform1.location = adresses[0].name + name + name2;
    },
    /**
     * 家庭住址弹框确定
     * @author cwz
     */
    onfamilyadresses(familyadresses) {
      this.familyadresses =
        familyadresses[0].name +
        familyadresses[1].name +
        familyadresses[2].name;
      this.form.familyProvince = familyadresses[0].name;
      this.form.familyCity = familyadresses[1].name;
      this.form.familyDistrict = familyadresses[2].name;
      this.familyadressesVisible = false;
    },
    //出生年月
    formatter(type, val) {
      if (type === "year") {
        let year = `${val}年`;
        return year;
      } else if (type === "month") {
        let month = `${val}月`;
        return month;
      }
      return val;
    }
  }
};
</script>

<style scoped lang="stylus">
>>>.xx {
  >span {
    position: relative;

    &:after {
      position: absolute;
      right: -10px;
      color: #ee0a24;
      font-size: 0.37333rem;
      content: '*';
    }
  }
}

.van-cell:not(:last-child)::after {
  left: 0;
}

.student-more-info-edit {
  &-content {
    margin: 20px;
  }

  .form-split-title {
    height: 32px;
    line-height: 32px;
    font-size: 14px;
    margin: 0 16px;
    color: #999999;
    background-color: #F2F2F2;
  }

  >>>.van-radio__icon--checked+span {
    color: #00CCFF;
  }
}

.img {
  height: 80px;
}

.action-save-btn {
  width: 100%;
  height: 49px;
  color: #fff;
  background: rgba(0, 204, 255, 1);
  // 消除默认样式
  margin: 0px;
  padding: 0px;
  border: 0px;
}
</style>
