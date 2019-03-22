package com.kakamusili.andikwa.repository;

import com.kakamusili.andikwa.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

    public User findByUserNameAndPassword(String userName, String password);

}
