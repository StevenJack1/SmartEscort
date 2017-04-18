package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Address;
import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.AddressService;
import cn.attackme.escort.Service.AreaService;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.hibernate.transform.ToListResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toList;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by arthurme on 2017/3/25.
 */
@RequestMapping("/User/ManageAddress")
@Controller
public class ManageAddressController {
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private AreaService areaService;

    @RequiresRoles("user")
    @GetMapping("/")
    public String index(){
        return "User/ManageAddress/index";
    }

    @RequiresRoles("user")
    @GetMapping("/add")
    public String addPage(){
        return "User/ManageAddress/add";
    }

    @RequiresRoles("user")
    @GetMapping("/edit")
    public String editPage(){
        return "User/ManageAddress/edit";
    }

    @RequiresRoles("user")
    @ResponseBody
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody Address address){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        address.setUser(user);
        String areaName = address.getArea().getAreaName();
        Area area = areaService.getByName(areaName);
        address.setArea(area);
        addressService.save(address);
        return new ResponseEntity<Void>(HttpStatus.CREATED);
    }

    @ResponseBody
    @GetMapping("/getAllSchoolName")
    public ResponseEntity<List<String>> getAllSchoolName(){
        List<School> schoolList = schoolService.getAll();
        List<String> stringList = schoolList.stream().map(School::getSchoolName).collect(toList());
        return new ResponseEntity<List<String>>(stringList,HttpStatus.OK);
    }

    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/getAreaNameList")
    public ResponseEntity<List<String>> getAreaNameList(){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        List<Area> areaList = user.getSchool().getAreaList();
        List<String> stringList = areaList.stream().map(Area::getAreaName).collect(toList());
        return new ResponseEntity<List<String>>(stringList,HttpStatus.OK);
    }
}
