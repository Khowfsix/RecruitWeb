//using Api.ViewModels.QuestionSkill;
//using AutoMapper;
//using Data;
//using Data.Entities;
//using Data.Interfaces;
//using Data.Mapping;
//using Data.Repositories;
//using FakeItEasy;
//using Service;

//namespace UnitTest.RepositoryTests
//{
//    public class QuestionSkillRepository_UnitTest
//    {
//        private readonly QuestionSkillRepository _QuestionSkillRepository;
//        private readonly QuestionSkillService _QuestionSkillService;

//        private readonly RecruitmentWebContext _fakeDbContext = A.Fake<RecruitmentWebContext>();
//        private readonly IQuestionSkillRepository _fakeQuestionSkillRepository = A.Fake<IQuestionSkillRepository>();
//        private readonly IUnitOfWork _fakeUow = A.Fake<IUnitOfWork>();
//        private readonly IMapper _mapper;

//        public QuestionSkillRepository_UnitTest()
//        {
//            _mapper = new MapperConfiguration(cfg =>
//                        {
//                            cfg.AddProfile(new AutoMapperConfiguration());
//                        }).CreateMapper();

//            _QuestionSkillRepository = new QuestionSkillRepository(_fakeDbContext, _fakeUow, _mapper);
//            _QuestionSkillService = new QuestionSkillService(_fakeQuestionSkillRepository, _mapper);
//        }

//        [Fact]
//        public async Task Add_QuestionSkill_In_Repository_Returns_Correctly()
//        {
//            //Code để check repo trả về model với id tạo ở model, tên giống tên truyền vào từ add model
//            //Arrange
//            var fakeQuestionSkillsId = Guid.NewGuid();

//            var fakeCreatedQuestionSkill = new QuestionSkillAddModel
//            {
//                QuestionId = Guid.NewGuid(),
//            };

//            var mappedCreatedQuestionSkill = _mapper.Map<QuestionSkillModel>(fakeCreatedQuestionSkill);
//            mappedCreatedQuestionSkill.QuestionSkillsId = fakeQuestionSkillsId;
//            //Act
//            var response = await _QuestionSkillRepository.AddQuestionSkill(mappedCreatedQuestionSkill);

//            //Assert
//            Assert.NotEqual(fakeQuestionSkillsId, response.QuestionSkillsId);
//        }

//        [Fact]
//        public async Task Get_QuestionSkill_Returns_Correctly()
//        {
//            //Arrange
//            List<QuestionSkillModel> list
//            var expectedCreatedQuestionSkill1 = new QuestionSkillModel
//            {
//                QuestionSkillsId = Guid.NewGuid(),
//            };
//            var expectedCreatedQuestionSkill2 = new QuestionSkillModel
//            {
//                QuestionSkillsId = Guid.NewGuid(),
//            };
//            var expectedCreatedQuestionSkill3 = new QuestionSkillModel
//            {
//                QuestionSkillsId = Guid.NewGuid(),
//            };
//            list.Add(expectedCreatedQuestionSkill1);
//            list.Add(expectedCreatedQuestionSkill2);
//            list.Add(expectedCreatedQuestionSkill3);
//            //Act
//            A.CallTo(() => _fakeQuestionSkillRepository.GetAllQuestionSkills()).Returns(list);
//            var response = await _QuestionSkillService.GetAllQuestionSkills();

//            //Assert
//            Assert.IsAssignableFrom<IEnumerable<QuestionSkillViewModel>>(response);
//        }
//    }
//}