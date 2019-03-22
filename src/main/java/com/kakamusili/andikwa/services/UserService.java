package com.kakamusili.andikwa.services;

import com.kakamusili.andikwa.model.User;
import com.kakamusili.andikwa.repository.UserRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserService {

    private final UserRepository  userRepository;

    public UserService(UserRepository userRepository) {
       this.userRepository = userRepository;
    }


    public  void saveMyUser(User user)
    {
        userRepository.save(user);
    }

    public List<User> showAllUsers()
    {
        List<User> users=new ArrayList<User>();
        for(User user:userRepository.findAll())
        {
            users.add(user);
        }

        return  users;
    }

    public void deleteMyUser(int id)
    {
        userRepository.deleteById(id);

    }
    public User editMyUser(Integer id)
    {
         User user =userRepository.findById(id).get();

        return user;
    }

    public User findByUserNameAndPassword(String userName, String password){
        return userRepository.findByUserNameAndPassword(userName,password);
    }
}
