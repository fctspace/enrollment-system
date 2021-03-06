package com.educiot.recruit.server.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.educiot.common.base.BaseController;
import com.educiot.common.base.Result;
import com.educiot.common.constant.Constant;
import com.educiot.common.util.JSONRedisUtil;
import com.educiot.recruit.data.entity.Province;
import com.educiot.recruit.data.entity.vo.ProvinceVO;
import com.educiot.recruit.data.service.IProvinceService;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 省市区县 前端控制器
 * </p>
 *
 * @author LiuHao
 * @since 2020-06-12
 */
@RestController
@RequestMapping("/province")
public class ProvinceController extends BaseController {

    @Resource
    private IProvinceService provinceService;

    @GetMapping("/getProvinceList")
    @ApiOperation(value = "获取省份列表", response = Province.class)
    public Result<?> getProvinceList() {

        QueryWrapper<Province> wrapper = new QueryWrapper<>();
        wrapper.eq("parentid", 1);
        List<Province> result = provinceService.list(wrapper);
        return Result.success(result);

    }

    @GetMapping("/getCityList/{provinceId}")
    @ApiOperation(value = "获取城市列表", response = Province.class)
    public Result<?> getCityList(@PathVariable Long provinceId) {

        QueryWrapper<Province> wrapper = new QueryWrapper<>();
        wrapper.eq("parentid", provinceId);
        List<Province> result = provinceService.list(wrapper);
        return Result.success(result);
    }

    @GetMapping("/getDistrictList/{cityId}")
    @ApiOperation(value = "获取区县列表", response = Province.class)
    public Result<?> getDistrictList(@PathVariable Long cityId) {
        QueryWrapper<Province> wrapper = new QueryWrapper<>();
        wrapper.eq("parentid", cityId);
        List<Province> result = provinceService.list(wrapper);
        return Result.success(result);
    }

    @GetMapping("/getAllList")
    @ApiOperation(value = "获取全部地区列表", response = ProvinceVO.class)
    public Result<?> getAllList() {
//        List<SysRegionVO> result = sysRegionService.getAllList();
//        return Result.success(result);

        List<ProvinceVO> result = JSONRedisUtil.parseArrayAllField(Constant.RedisKey.PROVINCE, ProvinceVO.class);
//        List<SysRegionVO> result = JSONObject.parseArray(test, SysRegionVO.class);
        return Result.success(result);
    }
}
