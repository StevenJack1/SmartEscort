package cn.attackme.escort.Service;


import cn.attackme.escort.Model.User;
import cn.attackme.escort.Repository.Query;
import cn.attackme.escort.Utils.PageResults;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by arthurme on 2017/1/29.
 */
@SuppressWarnings("unchecked")
@Service
public class UserService extends BaseService<User>{

    @Deprecated
    @Override
    public void save(@NotNull User user) {
        throw new UnsupportedOperationException("不支持该方法");
    }


    @Deprecated
    @Override
    public void saveAll(@NotNull List<User> userList) {
        throw new UnsupportedOperationException("不支持该方法");
    }

    @Deprecated
    public void updatePassWord(@NotNull User user) {
        throw new UnsupportedOperationException("不支持该方法");
    }

    @Deprecated
    public void updateAllPassWord(@NotNull List<User> userList) {
        throw new UnsupportedOperationException("不支持该方法");
    }


    @Deprecated
    @Override
    public void saveOrUpdate(@NotNull User user) {
        throw new UnsupportedOperationException("不支持该方法");
    }


    @Deprecated
    @Override
    public void saveOrUpdateAll(@NotNull List<User> userList) {
        super.saveOrUpdateAll(userList);
    }

    @Override
    public boolean contains(@NotNull User model) {
        return !model.isDeleted() && super.contains(model);
    }

    @Deprecated
    @Override
    public void delete(@NotNull User model) {
        throw new UnsupportedOperationException("不支持该方法");
    }

    @Deprecated
    @Override
    public void deleteAll(@NotNull List<User> modelList) {
        throw new UnsupportedOperationException("不支持该方法");
    }

    @Deprecated
    @Override
    public void deleteById(@NotNull Serializable id) {
        throw new UnsupportedOperationException("不支持该方法");
    }

    @Override
    public User getById(@NotNull Serializable id) {
        User User = super.getById(id);
        if (User != null && User.isDeleted()) {
            return null;
        } else {
            return User;
        }
    }

    @Override
    public List<User> getAll() {
        List<User> UserList = super.getAll();
        return UserList
                .stream()
                .filter(item -> !item.isDeleted())
                .collect(Collectors.toList());
    }

    @Override
    public PageResults<User> getListByPage(@NotNull Integer currentPageNumber, @NotNull Integer pageSize) {
        Query query = new Query(entityManager);
        query.from(User.class)
                .whereEqual("isDeleted", false);
        return super.getListByPageAndQuery(currentPageNumber, pageSize, query);
    }

    @Override
    public PageResults<User> getListByPageAndQuery(@NotNull Integer currentPageNumber,
                                                   @NotNull Integer pageSize,
                                                   @NotNull Query query) {
        query.whereEqual("isDeleted", false);
        return super.getListByPageAndQuery(currentPageNumber, pageSize, query);
    }

    @Override
    public int getCount() {
        Query query = new Query(entityManager);
        query.from(User.class)
                .whereEqual("isDeleted", false);
        return super.getCountByQuery(query);
    }

    @Override
    public int getCountByQuery(@NotNull Query query) {
        query.whereEqual("isDeleted", false);
        return super.getCountByQuery(query);
    }
}
