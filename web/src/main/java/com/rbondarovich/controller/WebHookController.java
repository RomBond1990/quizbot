package com.rbondarovich.controller;

import com.rbondarovich.TelegramQuizBot;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.objects.Update;

@RestController
@RequiredArgsConstructor
public class WebHookController {

    private final TelegramQuizBot telegramBot;

    @PostMapping(value = "/")
    public BotApiMethod<?> onUpdateReceived (@RequestBody Update update) {
        return telegramBot.onWebhookUpdateReceived(update);
    }
}
