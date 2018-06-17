package cn.attackme.escort.Model;

import cn.attackme.escort.Annotations.NotCode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 *快递公司
 * Created by hujian on 2017/3/24.
 */
@Entity
@Table

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourierCompany implements Serializable{

    private static final long serialVersionUID = 1816714040081981846L;

    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator",strategy = "increment")
    private Integer id;

    //快递名称
    @NotBlank
    @NotCode
    private String companyName;

    public CourierCompany(String companyName) {
        this.companyName = companyName;
    }
}
