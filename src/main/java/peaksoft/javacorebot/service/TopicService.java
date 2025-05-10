package peaksoft.javacorebot.service;

import org.springframework.stereotype.Service;
import peaksoft.javacorebot.entities.Topic;
import peaksoft.javacorebot.repository.TopicRepository;

import java.util.List;
import java.util.Optional;

@Service
public class TopicService {
    private final TopicRepository topicRepository;

    public TopicService(TopicRepository topicRepository) {
        this.topicRepository = topicRepository;
    }

    public List<Topic> getAllTopics() {
        return topicRepository.findAll();
    }

    public Optional<Topic> getTopicById(Long id) {
        return topicRepository.findById(id);
    }
}
