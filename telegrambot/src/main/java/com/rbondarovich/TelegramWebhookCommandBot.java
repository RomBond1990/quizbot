package com.rbondarovich;

import org.telegram.telegrambots.bots.DefaultBotOptions;
import org.telegram.telegrambots.bots.TelegramWebhookBot;
import org.telegram.telegrambots.extensions.bots.commandbot.commands.CommandRegistry;
import org.telegram.telegrambots.extensions.bots.commandbot.commands.IBotCommand;
import org.telegram.telegrambots.extensions.bots.commandbot.commands.ICommandRegistry;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.objects.Message;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.bots.AbsSender;

import java.util.Collection;
import java.util.Map;
import java.util.function.BiConsumer;

abstract public class TelegramWebhookCommandBot extends TelegramWebhookBot implements ICommandRegistry {
    private final CommandRegistry commandRegistry;

    public TelegramWebhookCommandBot() {
        this(new DefaultBotOptions());
    }

    public TelegramWebhookCommandBot(DefaultBotOptions options) {
        this(options, true);
    }

    public TelegramWebhookCommandBot(DefaultBotOptions options, boolean allowCommandsWithUsername) {
        super(options);
        this.commandRegistry = new CommandRegistry(allowCommandsWithUsername, this::getBotUsername);
    }

    @Override
    public void registerDefaultAction(BiConsumer<AbsSender, Message> defaultConsumer) {
        this.commandRegistry.registerDefaultAction(defaultConsumer);
    }

    @Override
    public boolean register(IBotCommand botCommand) {
        return this.commandRegistry.register(botCommand);
    }

    @Override
    public Map<IBotCommand, Boolean> registerAll(IBotCommand... botCommands) {
        return this.commandRegistry.registerAll(botCommands);
    }

    @Override
    public boolean deregister(IBotCommand botCommand) {
        return this.commandRegistry.deregister(botCommand);
    }

    @Override
    public Map<IBotCommand, Boolean> deregisterAll(IBotCommand... botCommands) {
        return this.commandRegistry.deregisterAll(botCommands);
    }

    @Override
    public Collection<IBotCommand> getRegisteredCommands() {
        return this.commandRegistry.getRegisteredCommands();
    }

    @Override
    public IBotCommand getRegisteredCommand(String commandIdentifier) {
        return this.commandRegistry.getRegisteredCommand(commandIdentifier);
    }

    @Override
    public abstract String getBotUsername();

    @Override
    public abstract String getBotToken();

    @Override
    public abstract BotApiMethod onWebhookUpdateReceived(Update update);

    @Override
    public abstract String getBotPath();
}
