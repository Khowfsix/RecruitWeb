//using Api.ViewModels.CandidateJoinEvent;
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
//    public class CandidateJoinEventRepository_UnitTest
//    {
//        private readonly CandidateJoinEventRepository _CandidateJoinEventRepository;
//        private readonly CandidateJoinEventService _CandidateJoinEventService;

//        private readonly RecruitmentWebContext _fakeDbContext = A.Fake<RecruitmentWebContext>();
//        private readonly ICandidateJoinEventRepository _fakeCandidateJoinEventRepository = A.Fake<ICandidateJoinEventRepository>();
//        private readonly IEventRepository _fakeEventRepository = A.Fake<IEventRepository>();
//        private readonly IUnitOfWork _fakeUow = A.Fake<IUnitOfWork>();
//        private readonly IMapper _mapper;

//        public CandidateJoinEventRepository_UnitTest()
//        {
//            _mapper = new MapperConfiguration(cfg =>
//                        {
//                            cfg.AddProfile(new AutoMapperConfiguration());
//                        }).CreateMapper();

//            _CandidateJoinEventRepository = new CandidateJoinEventRepository(_fakeDbContext, _fakeUow, _mapper);
//            _CandidateJoinEventService = new CandidateJoinEventService(_fakeCandidateJoinEventRepository, _fakeEventRepository, _mapper);
//        }

//        [Fact]
//        public async Task Add_CandidateJoinEvent_In_Repository_Returns_Correctly()
//        {
//            //Code để check repo trả về model với id tạo ở model, tên giống tên truyền vào từ add model
//            //Arrange
//            var fakeCandidateJoinEventId = Guid.NewGuid();
//            var fakeCreatedCandidateJoinEvent = new CandidateJoinEventAddModel
//            {
//                CandidateId = Guid.NewGuid(),
//            };

//            var mappedCreatedCandidateJoinEvent = _mapper.Map<CandidateJoinEventModel>(fakeCreatedCandidateJoinEvent);
//            mappedCreatedCandidateJoinEvent.CandidateJoinEventId = fakeCandidateJoinEventId;
//            //Act
//            var response = await _CandidateJoinEventRepository.SaveCandidateJoinEvent(mappedCreatedCandidateJoinEvent);

//            //Assert
//            Assert.NotEqual(mappedCreatedCandidateJoinEvent.CandidateJoinEventId, response.CandidateJoinEventId);
//        }

//        [Fact]
//        public async Task Get_CandidateJoinEvent_Returns_Correctly()
//        {
//            //Arrange
//            List<CandidateJoinEventModel> list

//            var expectedCreatedCandidateJoinEvent1 = new CandidateJoinEventModel
//            {
//                CandidateJoinEventId = Guid.NewGuid(),
//            };
//            var expectedCreatedCandidateJoinEvent2 = new CandidateJoinEventModel
//            {
//                CandidateJoinEventId = Guid.NewGuid(),
//            };
//            var expectedCreatedCandidateJoinEvent3 = new CandidateJoinEventModel
//            {
//                CandidateJoinEventId = Guid.NewGuid(),
//            };
//            list.Add(expectedCreatedCandidateJoinEvent1);
//            list.Add(expectedCreatedCandidateJoinEvent2);
//            list.Add(expectedCreatedCandidateJoinEvent3);

//            //Act
//            A.CallTo(() => _fakeCandidateJoinEventRepository.GetAllCandidateJoinEvents()).Returns(list);
//            var response = await _CandidateJoinEventService.GetAllCandidateJoinEvents();

//            //Assert
//            Assert.IsAssignableFrom<IEnumerable<CandidateJoinEventViewModel>>(response);
//        }
//    }
//}