package com.sportingtechnology.spring.lrs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import uk.co.sportssoftware.account.IAccountService;
import uk.co.sportssoftware.account.valueobjects.SportsPersonVO;

@Service
public class FlowUserDetailsService implements UserDetailsService {

    @Autowired
    private IAccountService accountService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        final SportsPersonVO sportsPerson = accountService.findSportsPersonByUsername(username, "1");
        if (sportsPerson == null) {
            throw new UsernameNotFoundException(username);
        }
        return User.withUsername(sportsPerson.getEntity().getUsername()).password(sportsPerson.getLmsPassword()).authorities("USER").build();
    }
}
