package cn.attackme.escort.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by arthurme on 2017/3/25.
 */
@RequestMapping("/User")
@Controller
public class ManageAddressController {
    @GetMapping("/ManageAddress")
    public String index(){
        return "/User/manageAddress";
    }
}
