//using Api.ViewModels.Requirement;
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
//    public class RequirementRepository_UnitTest
//    {
//        private readonly RequirementRepository _RequirementRepository;
//        private readonly RequirementService _RequirementService;

//        private readonly RecruitmentWebContext _fakeDbContext = A.Fake<RecruitmentWebContext>();
//        private readonly IRequirementRepository _fakeRequirementRepository = A.Fake<IRequirementRepository>();
//        private readonly IUnitOfWork _fakeUow = A.Fake<IUnitOfWork>();
//        private readonly IMapper _mapper;

//        public RequirementRepository_UnitTest()
//        {
//            _mapper = new MapperConfiguration(cfg =>
//                        {
//                            cfg.AddProfile(new AutoMapperConfiguration());
//                        }).CreateMapper();

//            _RequirementRepository = new RequirementRepository(_fakeDbContext, _fakeUow, _mapper);
//            _RequirementService = new RequirementService(_fakeRequirementRepository, _mapper);
//        }

//        [Fact]
//        public async Task Add_Requirement_In_Repository_Returns_Correctly()
//        {
//            //Code để check repo trả về model với id tạo ở model, tên giống tên truyền vào từ add model
//            //Arrange
//            var fakeRequirementId = Guid.NewGuid();

//            var fakeCreatedRequirement = new RequirementAddModel
//            {
//                PositionId = Guid.NewGuid(),
//                SkillId = Guid.NewGuid()
//            };

//            var mappedCreatedRequirement = _mapper.Map<RequirementModel>(fakeCreatedRequirement);
//            mappedCreatedRequirement.RequirementId = fakeRequirementId;
//            //Act
//            var response = await _RequirementRepository.SaveRequirement(mappedCreatedRequirement);

//            //Assert
//            Assert.NotEqual(mappedCreatedRequirement.RequirementId, response.RequirementId);
//        }

//        [Fact]
//        public async Task Get_Requirement_Returns_Correctly()
//        {
//            //Arrange
//            List<RequirementModel> list
//            var expectedCreatedRequirement1 = new RequirementModel
//            {
//                RequirementId = Guid.NewGuid(),
//                IsDeleted = false
//            };
//            var expectedCreatedRequirement2 = new RequirementModel
//            {
//                RequirementId = Guid.NewGuid(),
//                IsDeleted = false
//            };
//            var expectedCreatedRequirement3 = new RequirementModel
//            {
//                RequirementId = Guid.NewGuid(),
//                IsDeleted = false
//            };
//            list.Add(expectedCreatedRequirement1);
//            list.Add(expectedCreatedRequirement2);
//            list.Add(expectedCreatedRequirement3);
//            //Act
//            A.CallTo(() => _fakeRequirementRepository.GetAllRequirement()).Returns(list);
//            var response = await _RequirementService.GetAllRequirement();

//            //Assert
//            Assert.IsAssignableFrom<IEnumerable<RequirementViewModel>>(response);
//        }
//    }
//}