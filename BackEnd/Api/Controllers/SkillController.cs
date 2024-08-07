﻿using Api.ViewModels.Skill;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Service.Interfaces;
using Service.Models;

namespace Api.Controllers
{
    [Authorize]
    public class SkillController : BaseAPIController
    {
        private readonly ISkillService _skillService;
        private readonly IMapper _mapper;

        public SkillController(ISkillService skillService,
            IMapper mapper)
        {
            _skillService = skillService;
            _mapper = mapper;
        }

        [HttpGet("[action]")]
        [AllowAnonymous]
        public async Task<IActionResult> GetSkillById(Guid skillId)
        {
            var modelData = await _skillService.GetSkillById(skillId);
            var response = _mapper.Map<SkillViewModel>(modelData);

            return response is not null ? Ok(response) : NotFound(skillId);
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> GetAllSkill(string? query)
        {
            var isAdmin = HttpContext.User.IsInRole("Admin");
            var models = await _skillService.GetAllSkills(isAdmin, query);
            if (models == null)
            {
                return NotFound();
            }
            var resp = _mapper.Map<List<SkillViewModel>>(models);
            return Ok(resp);
        }

        [HttpPost]
        [Authorize(Roles = "Recruiter,Interviewer,Admin")]
        public async Task<IActionResult> SaveSkill(SkillAddModel skillModel)
        {
            if (skillModel == null)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
            }
            var model = _mapper.Map<SkillModel>(skillModel);
            var skilllist = await _skillService.SaveSkill(model);
            return Ok(skilllist);
        }

        [HttpPut("{id:guid}")]
        [Authorize(Roles = "Recruiter,Interviewer,Admin")]
        public async Task<IActionResult> UpdateSkill(SkillUpdateModel skillModel, Guid id)
        {
#pragma warning disable CS8073 // The result of the expression is always the same since a value of this type is never equal to 'null'
            if (id == null)
            {
                return StatusCode(StatusCodes.Status400BadRequest);
            }
#pragma warning restore CS8073 // The result of the expression is always the same since a value of this type is never equal to 'null'
            var model = _mapper.Map<SkillModel>(skillModel);
            var skillList = await _skillService.UpdateSkill(model, id);
            return Ok(skillList);
        }

        [HttpDelete("{id:guid}")]
        [Authorize(Roles = "Recruiter,Interviewer,Admin")]
        public async Task<IActionResult> DeleteSkill(Guid id)
        {
#pragma warning disable CS8073 // The result of the expression is always the same since a value of this type is never equal to 'null'
            if (id != null)
            {
                var skillList = await _skillService.DeleteSkill(id);
                return Ok(skillList);
            }
#pragma warning restore CS8073 // The result of the expression is always the same since a value of this type is never equal to 'null'
            return StatusCode(StatusCodes.Status400BadRequest);
        }
    }
}