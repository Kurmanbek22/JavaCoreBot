package peaksoft.javacorebot.bot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.CallbackQuery;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import peaksoft.javacorebot.service.SubTopicService;
import peaksoft.javacorebot.service.TopicService;

import java.util.ArrayList;
import java.util.List;

@Component
public class JavaCoreBot extends TelegramLongPollingBot {

    private static final Logger logger = LoggerFactory.getLogger(JavaCoreBot.class);

    private final TopicService topicService;
    private final SubTopicService subTopicService;

    public JavaCoreBot(TopicService topicService, SubTopicService subTopicService) {
        this.topicService = topicService;
        this.subTopicService = subTopicService;
    }

    @Override
    public void onUpdateReceived(Update update) {
        if (update.hasCallbackQuery()) {
            handleCallbackQuery(update.getCallbackQuery());
        } else if (update.hasMessage() && update.getMessage().hasText()) {
            handleMessage(update.getMessage().getChatId(), update.getMessage().getText());
        }
    }

    private void handleCallbackQuery(CallbackQuery callbackQuery) {
        String callbackData = callbackQuery.getData();
        long chatId = callbackQuery.getMessage().getChatId();

        switch (callbackData) {
            case "back_to_topics":
                showMainMenu(chatId);
                break;
            default:
                if (callbackData.startsWith("topic_")) {
                    long topicId = Long.parseLong(callbackData.split("_")[1]);
                    showSubtopics(chatId, topicId);
                } else if (callbackData.startsWith("subtopic_")) {
                    long subtopicId = Long.parseLong(callbackData.split("_")[1]);
                    showSubtopicExplanation(chatId, subtopicId);
                } else if (callbackData.startsWith("back_to_subtopics_")) {
                    long topicId = Long.parseLong(callbackData.split("_")[3]);
                    showSubtopics(chatId, topicId);
                }
                break;
        }
    }

    private void handleMessage(Long chatId, String text) {
        if ("/start".equals(text)) {
            showMainMenu(chatId);
        }
    }

    private void showMainMenu(Long chatId) {
        SendMessage message = createSendMessage(chatId, "📚 Список тем:");

        InlineKeyboardMarkup markup = new InlineKeyboardMarkup();
        List<List<InlineKeyboardButton>> rows = new ArrayList<>();

        topicService.getAllTopics().forEach(topic -> {
            InlineKeyboardButton button = new InlineKeyboardButton();
            button.setText(topic.getTitle());
            button.setCallbackData("topic_" + topic.getId());

            List<InlineKeyboardButton> row = new ArrayList<>();
            row.add(button);
            rows.add(row);
        });

        markup.setKeyboard(rows);
        message.setReplyMarkup(markup);
        executeMessage(message);
    }

    private void showSubtopics(Long chatId, Long topicId) {
        SendMessage message = createSendMessage(chatId, "🔍 Подтемы:");

        InlineKeyboardMarkup markup = new InlineKeyboardMarkup();
        List<List<InlineKeyboardButton>> rows = new ArrayList<>();

        subTopicService.getSubtopicsByTopicId(topicId).forEach(subtopic -> {
            InlineKeyboardButton button = new InlineKeyboardButton();
            button.setText(subtopic.getTitle());
            button.setCallbackData("subtopic_" + subtopic.getId());

            List<InlineKeyboardButton> row = new ArrayList<>();
            row.add(button);
            rows.add(row);
        });

        // 🔄 Добавляем кнопку "Назад к темам"
        InlineKeyboardButton backButton = new InlineKeyboardButton();
        backButton.setText("🔙 Назад");
        backButton.setCallbackData("back_to_topics");
        rows.add(List.of(backButton));

        markup.setKeyboard(rows);
        message.setReplyMarkup(markup);
        executeMessage(message);
    }

    private void showSubtopicExplanation(Long chatId, Long subtopicId) {
        subTopicService.getSubtopicById(subtopicId).ifPresent(subtopic -> {
            String explanation = subtopic.getExplanation().replace("\\n", "\n");
            SendMessage message = new SendMessage();
            message.setChatId(chatId);
            message.setText("📝 " + explanation);
            message.setParseMode("Markdown"); // Важно для отображения кода
            message.disableWebPagePreview();  // Убирает превью, если вдруг есть ссылка

            // 🔄 Добавляем кнопку "Назад к подтемам"
            InlineKeyboardMarkup markup = new InlineKeyboardMarkup();
            List<List<InlineKeyboardButton>> rows = new ArrayList<>();

            InlineKeyboardButton backButton = new InlineKeyboardButton();
            backButton.setText("🔙 Назад");
            backButton.setCallbackData("back_to_subtopics_" + subtopic.getTopic().getId());

            rows.add(List.of(backButton));
            markup.setKeyboard(rows);

            message.setReplyMarkup(markup);
            executeMessage(message);
        });
    }

    private SendMessage createSendMessage(Long chatId, String text) {
        SendMessage message = new SendMessage();
        message.setChatId(chatId);
        message.setText(text);
        return message;
    }

    private void executeMessage(SendMessage message) {
        try {
            execute(message);
        } catch (TelegramApiException e) {
            logger.error("Error while sending message: {}", e.getMessage(), e);
        }
    }

    @Override
    public String getBotUsername() {
        return "JavaCoreInterviewBot";
    }

    @Override
    public String getBotToken() {
        return "7884329646:AAGxjMDuTioJDKtUx4qvsINd-E9pwCC5Tlk";
    }
}
