package com.edtech.controllers;

import com.edtech.models.Challenge;
import com.edtech.services.ChallengeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {

    @Autowired
    private ChallengeService challengeService;

    @GetMapping("/admin/challenge")
    public String challenge() {
        return "admin-add-challenge";
    }

    @PostMapping("/admin/add/challenge")
    public String showAddChallengeForm(Challenge challenge) {
        challengeService.createChallenge(challenge);
        return "redirect:/admin-home";
    }
}
