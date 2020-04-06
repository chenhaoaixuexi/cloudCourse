package com.roncoo.education.course.service.feign;

import com.roncoo.education.course.feign.interfaces.IFeignCourseAudit;
import com.roncoo.education.course.feign.qo.CourseAuditQO;
import com.roncoo.education.course.feign.vo.CourseAuditVO;
import com.roncoo.education.util.base.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.roncoo.education.course.service.feign.biz.FeignCourseAuditBiz;
import com.roncoo.education.util.base.BaseController;

/**
 * 课程信息-审核
 *
 * @author wujing
 */
@RestController
public class FeignCourseAuditController extends BaseController implements IFeignCourseAudit {

    @Autowired
    private FeignCourseAuditBiz biz;

    @Override
    public Page<CourseAuditVO> listForPage(@RequestBody CourseAuditQO qo) {
        return biz.listForPage(qo);
    }

    @Override
    public int save(@RequestBody CourseAuditQO qo) {
        return biz.save(qo);
    }

    @Override
    public int deleteById(@PathVariable(value = "id") Long id) {
        return biz.deleteById(id);
    }

    @Override
    public int updateById(@RequestBody CourseAuditQO qo) {
        return biz.updateById(qo);
    }

    @Override
    public CourseAuditVO getById(@PathVariable(value = "id") Long id) {
        return biz.getById(id);
    }

    @Override
    public int audit(@RequestBody CourseAuditQO qo) {
        return biz.audit(qo);
    }

    @Override
    public int updateStatusId(@RequestBody CourseAuditQO qo) {
        return biz.updateStatusId(qo);
    }

}
