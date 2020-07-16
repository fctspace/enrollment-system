package com.educiot.recruit.data.entity.query;

import com.educiot.recruit.common.base.BaseQuery;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 * @author Pan Juncai
 * @version 1.0
 * @date 2020/4/10 10:25
 */
@Data
@ApiModel(value = "分页查询生源学校信息列表入参实体")
@EqualsAndHashCode(callSuper = true)
public class ListSourceSchoolPageQuery extends BaseQuery {
    /**
     * 查询条件：学校名称
     */
    @ApiModelProperty(value = "学校名称", name = "searchKey")
    protected String searchKey;

    /**
     * 当前页
     */
    @ApiModelProperty(value = "当前页", name = "pageNum", required = true, example = "1")
    @NotNull(message = "当前页不能为空")
    @Min(value = 1L, message = "查询页码最小为1")
    @Max(value = Integer.MAX_VALUE, message = "查询页码超出最大限制")
    protected Integer pageNum;

    /**
     * 每页大小
     */
    @ApiModelProperty(value = "每页大小", name = "pageSize", required = true, example = "10")
    @NotNull(message = "每页大小不能为空")
    @Min(value = 1L, message = "每页最少查询一条数据")
    @Max(value = Integer.MAX_VALUE, message = "查询数量超出限制")
    protected Integer pageSize;

    /**
     * 学期Id
     */
    private Long semesterId;
}
