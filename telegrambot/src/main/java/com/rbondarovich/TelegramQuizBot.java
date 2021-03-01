package com.rbondarovich;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import javax.annotation.PostConstruct;
import java.util.Map;

@Component
public class TelegramQuizBot extends TelegramWebhookCommandBot {

    private String BOT_NAME;
    private String BOT_TOKEN;
    @Value("https://d7ac6a4da101.ngrok.io")
    private String WEBHOOK_PATH;

    @PostConstruct
    private void init () {
        Map<String, String> env = System.getenv();
        for (String envName : env.keySet()) {
            if (envName.equals("BOT_NAME")) {
                BOT_NAME = env.get(envName);
            }
            if(envName.equals("BOT_TOKEN")){
                BOT_TOKEN = env.get(envName);
            }
        }
    }

    @Override
    public BotApiMethod onWebhookUpdateReceived(Update update) {
        if(update.getMessage() != null && update.getMessage().hasText()) {
            Long chatId = update.getMessage().getChatId();

            try {
                execute(new SendMessage(chatId.toString(), "hi" + update.getMessage().getText()));
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public String getBotUsername() {
        return BOT_NAME;
    }

    @Override
    public String getBotToken() {
        return BOT_TOKEN;
    }

    @Override
    public String getBotPath() {
        return WEBHOOK_PATH;
    }
}
