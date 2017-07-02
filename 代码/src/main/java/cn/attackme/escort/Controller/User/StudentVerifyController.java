package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import cn.attackme.escort.Utils.LogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import static cn.attackme.escort.Utils.ImageUtils.decodeBase64ToImage;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by Administrator on 2017/5/23.
 */
@Controller
@RequestMapping("/User/StudentVerify")
public class StudentVerifyController {
    @Autowired
    private UserInfoService userInfoService;

    @GetMapping("/")
    public String index(){return "User/StudentVerify/index" ;}

    @GetMapping("/success")
    public String success(){
        return "User/StudentVerify/success";
    }

    @GetMapping("/failure")
    public String failure(){
        return "User/StudentVerify/failure";
    }

    @RequestMapping("/upLoad")
    public String upLoad(@RequestParam("dataUrl") String dataUrl){
        try {
            String userName = getSubject().getPrincipal().toString();
            User user = userInfoService.getById(userName);
            user.setStuCardUrl(decodeBase64ToImage(dataUrl, "D:/"));
            userInfoService.saveOrUpdate(user);
        } catch (Exception e) {
            LogUtils.LogToDB(e);
            return "/User/StudentVerify/failure";
        }
        return "/User/StudentVerify/success";
    }
}


