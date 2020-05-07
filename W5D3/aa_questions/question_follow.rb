require_relative "questions_database"

class QuestionFollow

    attr_accessor :question_id, :user_id
    attr_reader :id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                question_follows.id = ?;
        SQL
        QuestionFollow.new(data.first)
    end

    def self.followers_for_question_id(question_id)
        users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                users
            JOIN question_follows
                ON users.id = question_follows.user_id
            WHERE
                question_follows.question_id = ?;
        SQL

        users.map { |user| User.new(user) }
    end

    def self.followed_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                questions
            JOIN question_follows
                ON questions.id = question_follows.question_id
            WHERE
                question_follows.user_id = ?;
        SQL

        questions.map { |question| Question.new(question) }
    end

    def self.most_followed_questions(n)
        most_followed = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                questions.*
            FROM 
                questions
            LEFT JOIN question_follows
                ON questions.id = question_follows.question_id
            GROUP BY
                questions.id
            ORDER BY
                CASE
                    WHEN question_follows.question_id IS NULL THEN
                        0
                    ELSE
                        COUNT(*)
                END DESC
            LIMIT
                ?;
        SQL

        most_followed.map { |question| Question.new(question) }
    end

    def initialize(options)
        @id = options['id'] #??? " or ' ?
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

    private
    attr_writer :id
end