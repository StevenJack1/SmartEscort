package cn.attackme.escort.Service;

import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Repository.Query;
import cn.attackme.escort.Utils.PageResults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.NotNull;

/**
 * Created by hujian on 2017/4/17.
 */
@Service
public class AreaService extends BaseService<Area>{
    public Area getByNameAndSchool(@NotNull String areaName, @NotNull School school){
        Query query = new Query(entityManager);
        return (Area) query.from(Area.class)
                .whereEqual("areaName",areaName)
                .whereEqual("school",school)
                .createTypedQuery()
                .setFirstResult(0)
                .setMaxResults(1)
                .getSingleResult();
    }

}
