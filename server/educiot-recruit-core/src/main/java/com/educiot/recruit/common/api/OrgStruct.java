package com.educiot.recruit.common.api;

import com.educiot.recruit.common.base.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = false)
public class OrgStruct extends BaseVO {
    private String parentname;
    private String name;
    private String id;
    private String parentid;
    private List<Org> child;

}