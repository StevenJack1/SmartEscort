package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Annotations.NotCode;
import cn.attackme.escort.Annotations.Phone;
import cn.attackme.escort.Model.AuthStatus;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import static cn.attackme.escort.Utils.SHAUtils.getSHA_256;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:09
 * To change this template use File | Settings | File Templates.
 *个人信息
 */
@RequestMapping("/User/UserInfomation")
@Controller
public class UserInfomationController {
    @GetMapping("/")
    public String index(){
        return "User/UserInfomation/index";
    }

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private SchoolService schoolService;


    /**
     * 获取当前用户信息
     * @return
     */
    @ResponseBody
    @RequestMapping("/current")
    public User getInfo() throws UnsupportedEncodingException {
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        user.setNickName(URLDecoder.decode(user.getNickName(), "utf-8"));
        return user;
    }

    /**
     * 修改用户信息
     * @param name
     * @param phoneNumber
     * @return
     */
    @ResponseBody
    @PutMapping("/name/{name}/phoneNumber/{phoneNumber}")
    public ResponseEntity<Void> updateUser(@PathVariable @NotCode @NotBlank String name,
                                           @PathVariable @Phone String phoneNumber){
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        User currentUser = userInfoService.getById(userName);
        if(currentUser.getAuthStatus().equals(AuthStatus.未认证)){
            currentUser.setName(name);
        }
        currentUser.setPhoneNumber(phoneNumber);
        userInfoService.saveOrUpdate(currentUser);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    //修改学校
    @ResponseBody
    @PutMapping("/school/{school}")
    public ResponseEntity<Void> updateUSchool(@PathVariable @NotCode @NotBlank String school){
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        User currentUser = userInfoService.getById(userName);
        School school1 = schoolService.getByName(school);
        if(currentUser.getAuthStatus().equals(AuthStatus.未认证)&&currentUser.getSchool().getSchoolName() != school1.getSchoolName()){
            currentUser.setSchool(school1);
        }
        userInfoService.saveOrUpdate(currentUser);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
