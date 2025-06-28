// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AboutDao? _aboutDaoInstance;

  SkillsDao? _skillsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `About` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `headerSmallText` TEXT NOT NULL, `description` TEXT NOT NULL, `seeMyWorkLink` TEXT NOT NULL, `headerBigText` TEXT NOT NULL, `projects` TEXT NOT NULL, `workExperience` TEXT NOT NULL, `approaches` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `FetchSkills` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `headerSmallText` TEXT NOT NULL, `headerBigText` TEXT NOT NULL, `skills` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AboutDao get aboutDao {
    return _aboutDaoInstance ??= _$AboutDao(database, changeListener);
  }

  @override
  SkillsDao get skillsDao {
    return _skillsDaoInstance ??= _$SkillsDao(database, changeListener);
  }
}

class _$AboutDao extends AboutDao {
  _$AboutDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _aboutInsertionAdapter = InsertionAdapter(
            database,
            'About',
            (About item) => <String, Object?>{
                  'id': item.id,
                  'headerSmallText': item.headerSmallText,
                  'description': item.description,
                  'seeMyWorkLink': item.seeMyWorkLink,
                  'headerBigText':
                      _aboutHeaderTextModelConverter.encode(item.headerBigText),
                  'projects': _projectListConverter.encode(item.projects),
                  'workExperience': _workExperienceModelListConverter
                      .encode(item.workExperience),
                  'approaches':
                      _approachModelListConverter.encode(item.approaches)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<About> _aboutInsertionAdapter;

  @override
  Future<About?> fetchAbout() async {
    return _queryAdapter.query('SELECT * FROM About',
        mapper: (Map<String, Object?> row) => About(
            id: row['id'] as int?,
            headerSmallText: row['headerSmallText'] as String,
            headerBigText: _aboutHeaderTextModelConverter
                .decode(row['headerBigText'] as String),
            description: row['description'] as String,
            seeMyWorkLink: row['seeMyWorkLink'] as String,
            projects: _projectListConverter.decode(row['projects'] as String),
            workExperience: _workExperienceModelListConverter
                .decode(row['workExperience'] as String),
            approaches: _approachModelListConverter
                .decode(row['approaches'] as String)));
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM About');
  }

  @override
  Future<void> insertAbout(About about) async {
    await _aboutInsertionAdapter.insert(about, OnConflictStrategy.abort);
  }
}

class _$SkillsDao extends SkillsDao {
  _$SkillsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _fetchSkillsInsertionAdapter = InsertionAdapter(
            database,
            'FetchSkills',
            (FetchSkills item) => <String, Object?>{
                  'id': item.id,
                  'headerSmallText': item.headerSmallText,
                  'headerBigText':
                      _skillHeaderTextModelConverter.encode(item.headerBigText),
                  'skills': _skillsListTypeConverter.encode(item.skills)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FetchSkills> _fetchSkillsInsertionAdapter;

  @override
  Future<FetchSkills?> fetchSkills() async {
    return _queryAdapter.query('SELECT * FROM Skills',
        mapper: (Map<String, Object?> row) => FetchSkills(
            id: row['id'] as int?,
            headerSmallText: row['headerSmallText'] as String,
            headerBigText: _skillHeaderTextModelConverter
                .decode(row['headerBigText'] as String),
            skills: _skillsListTypeConverter.decode(row['skills'] as String)));
  }

  @override
  Future<void> deleteAllSkills() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Skills');
  }

  @override
  Future<void> insertSkills(FetchSkills skills) async {
    await _fetchSkillsInsertionAdapter.insert(skills, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _aboutHeaderTextModelConverter = AboutHeaderTextModelConverter();
final _workExperienceModelListConverter = WorkExperienceModelListConverter();
final _approachModelListConverter = ApproachModelListConverter();
final _projectListConverter = ProjectListConverter();
final _skillsListTypeConverter = SkillsListTypeConverter();
final _skillHeaderTextModelConverter = SkillHeaderTextModelConverter();
