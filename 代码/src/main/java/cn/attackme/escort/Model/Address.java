package cn.attackme.escort.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.ManyToAny;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 收货地址
 * Created by hujian on 2017/3/24.
 */
@Entity
@Table

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Address implements Serializable{

    private static final long serialVersionUID = 4321293707808080387L;

    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator",strategy = "increment")
    private Integer id;

    @OneToOne
    @JoinColumn(name = "area")
    private Area area;

    //详细地址
    private String detail;

    private String phoneNumber;

    private String receiverName;

    //是否是默认地址
    private boolean isDefault;

    @ManyToOne
    @JoinColumn(name = "user")
    private User user;
}
