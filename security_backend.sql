/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.3.66_3306
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : 192.168.3.66:3306
 Source Schema         : security_backend

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 26/08/2020 09:25:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `KID` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典主键',
  `NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `DELETED` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除(0未删除1已删除)',
  `SORT` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `PID` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '88888888888888888888888888888888' COMMENT '父级ID',
  `REMARKS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`KID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('000000003154d347000000000118619b', '已通过', 0, 3, '00000000382d48760000000079b1fbe5', '审核状态');
INSERT INTO `sys_dict` VALUES ('0000000037d27354ffffffffc4ef7062', '未通过', 0, 2, '00000000382d48760000000079b1fbe5', '审核状态');
INSERT INTO `sys_dict` VALUES ('000000000c4e6c01ffffffffb087ed08', '未审核', 1, 2, '00000000382d48760000000079b1fbe5', '审核状态');
INSERT INTO `sys_dict` VALUES ('ffffffffdf5ca826000000002855ee97', '未审核', 0, 1, '00000000382d48760000000079b1fbe5', '审核状态');
INSERT INTO `sys_dict` VALUES ('00000000382d48760000000079b1fbe5', '审核状态', 0, 1, '88888888888888888888888888888888', '根节点');
INSERT INTO `sys_dict` VALUES ('ffffffffc580f57b000000005d861734', '博士', 0, 9, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('ffffffff9e454217ffffffffb3d5e955', '硕士', 0, 8, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('00000000461deb28ffffffff87061372', '本科', 0, 7, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('00000000657d8fc30000000044020a60', '专科', 0, 6, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('ffffffffa20005cf0000000044d0c62f', '大专', 0, 5, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('0000000046e43ca9ffffffff8892d864', '中专', 0, 4, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('ffffffffabb9e458000000002264d37b', '高中', 0, 3, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('ffffffffee7f2588ffffffffa9e12b00', '初中', 0, 2, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('00000000090b40d7ffffffffb92e9caa', '小学', 0, 1, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('0000000051f9d61affffffff8405fc42', '学历', 0, 1, '88888888888888888888888888888888', '根节点');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `permission` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单标识(权限标识)',
  `category` smallint UNSIGNED NOT NULL DEFAULT 1 COMMENT '权限类型(1查询;2编辑;3删除;4添加)',
  `icon_style` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'menu-icon fa fa-caret-right' COMMENT '元素span后面的i元素样式',
  `pid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '88888888888888888888888888888888' COMMENT '父级id',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'javascript:;' COMMENT 'url路径',
  `subset` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否含子节点(1含子节点;0不含)',
  `type` smallint UNSIGNED NOT NULL DEFAULT 1 COMMENT '菜单类型(1导航菜单;2普通按钮;3行内按钮)',
  `relation` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '88888888888888888888888888888888' COMMENT '菜单层次级别关系(限制最多就8级导航菜单)',
  `order_by` smallint UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_menu_permission`(`permission`) USING BTREE,
  UNIQUE INDEX `index_menu_url`(`url`) USING BTREE,
  UNIQUE INDEX `index_menu_relation`(`relation`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0000000006a9099300000000100d10cd', '获取数据列表(搜索)', 'menu_btn_listData', 1, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/listData', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@0000000006a9099300000000100d10cd', 1);
INSERT INTO `sys_menu` VALUES ('000000000ba93c43ffffffffe5c59508', '添加', 'menu_btn_add', 1, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/add', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@000000000ba93c43ffffffffe5c59508', 2);
INSERT INTO `sys_menu` VALUES ('000000000ff54fcbffffffffbbe16acc', '添加', 'dictionary_btn_add', 4, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/add', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffffdc83a84dffffffffe53ca925@000000000ff54fcbffffffffbbe16acc', 2);
INSERT INTO `sys_menu` VALUES ('000000002441c5fe000000005f6b6829', '获取单条数据', 'dictionary_row_queryById', 1, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/queryById', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffffdc83a84dffffffffe53ca925@000000002441c5fe000000005f6b6829', 4);
INSERT INTO `sys_menu` VALUES ('000000002d8402d60000000072f7dea2', '获取数据列表(搜索)', 'user_btn_listData', 1, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/listData', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@000000002d8402d60000000072f7dea2', 1);
INSERT INTO `sys_menu` VALUES ('000000002e18cf48ffffffffab242e16', '角色菜单(保存)', 'role_row_saveRoleMenu', 4, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/saveRoleMenu', 0, 2, 'ffffffff8b559df0ffffffff834bba04@111fffffbd911aa0ffffffffd5637fff@000000002e18cf48ffffffffab242e16', 8);
INSERT INTO `sys_menu` VALUES ('0000000035fbca03000000003a33d6b7', '删除(批量删除)', 'user_btn_delByKeys', 3, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/delByKeys', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@0000000035fbca03000000003a33d6b7', 5);
INSERT INTO `sys_menu` VALUES ('000000003a56d4fb0000000037016444', '角色(保存)', 'user_btn_row_saveAllotRole', 4, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/saveAllotRole', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@000000003a56d4fb0000000037016444', 9);
INSERT INTO `sys_menu` VALUES ('00000000545f18ddffffffff9482ed27', '删除(行内删除)', 'dictionary_row_delById', 3, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/delById', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffffdc83a84dffffffffe53ca925@00000000545f18ddffffffff9482ed27', 5);
INSERT INTO `sys_menu` VALUES ('0000000058e2ec83000000002f978e03', '编辑', 'menu_row_edit', 2, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/edit', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@0000000058e2ec83000000002f978e03', 4);
INSERT INTO `sys_menu` VALUES ('000000005c41138100000000288a6b45', '删除(行内删除)', 'menu_row_delById', 3, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/delById', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@000000005c41138100000000288a6b45', 3);
INSERT INTO `sys_menu` VALUES ('000000007330a2a9ffffffff98cebe66', '添加', 'user_btn_add', 4, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/add', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@000000007330a2a9ffffffff98cebe66', 2);
INSERT INTO `sys_menu` VALUES ('0000000077224459ffffffffc9d752ca', '启用禁用', 'user_row_editEnabled', 2, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/editEnabled', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@0000000077224459ffffffffc9d752ca', 10);
INSERT INTO `sys_menu` VALUES ('000000007937b8de0000000034ef3b70', '清空菜单', 'role_row_delEmptyMenu', 3, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/delEmptyMenu', 0, 3, 'ffffffff8b559df0ffffffff834bba04@111fffffbd911aa0ffffffffd5637fff@000000007937b8de0000000034ef3b70', 6);
INSERT INTO `sys_menu` VALUES ('000000007a3bebc1ffffffffc0d19222', '角色(查询)', 'user_btn_row_getAllotRole', 1, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/getAllotRole', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@000000007a3bebc1ffffffffc0d19222', 8);
INSERT INTO `sys_menu` VALUES ('000000007ea75783000000004607fdec', '编辑', 'user_row_edit', 2, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/edit', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@000000007ea75783000000004607fdec', 3);
INSERT INTO `sys_menu` VALUES ('111fffffbd911aa0ffffffffd5637fff', '角色权限', 'page_sys_role', 1, 'menu-icon fa fa-caret-right', 'ffffffff8b559df0ffffffff834bba04', 'sys_role.html', 0, 1, 'ffffffff8b559df0ffffffff834bba04@111fffffbd911aa0ffffffffd5637fff', 3);
INSERT INTO `sys_menu` VALUES ('ffffffff84e5da13fffffffface485ec', '删除(批量删除)', 'dictionary_btn_delByKeys', 3, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/delByKeys', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffffdc83a84dffffffffe53ca925@ffffffff84e5da13fffffffface485ec', 6);
INSERT INTO `sys_menu` VALUES ('ffffffff87212d7d000000005fbd6e98', '添加', 'role_btn_add', 4, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/add', 0, 2, 'ffffffff8b559df0ffffffff834bba04@111fffffbd911aa0ffffffffd5637fff@ffffffff87212d7d000000005fbd6e98', 2);
INSERT INTO `sys_menu` VALUES ('ffffffff8b559df0ffffffff834bba04', '系统设置', 'page_sys_setting', 1, 'menu-icon fa fa-cog', '88888888888888888888888888888888', 'sys_setting', 1, 1, 'ffffffff8b559df0ffffffff834bba04', 1);
INSERT INTO `sys_menu` VALUES ('ffffffff8c468a55ffffffff8f59d635', '用户账号', 'page_sys_user', 1, 'menu-icon fa fa-caret-right', 'ffffffff8b559df0ffffffff834bba04', 'sys_user.html', 0, 1, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635', 2);
INSERT INTO `sys_menu` VALUES ('ffffffff8e6151ff0000000015f6e145', '删除(行内删除)', 'role_row_delById', 3, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/delById', 0, 3, 'ffffffff8b559df0ffffffff834bba04@111fffffbd911aa0ffffffffd5637fff@ffffffff8e6151ff0000000015f6e145', 4);
INSERT INTO `sys_menu` VALUES ('ffffffff93f9086effffffffb4a239cd', '删除(批量删除)', 'role_btn_delByKeys', 3, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/delByKeys', 0, 2, 'ffffffff8b559df0ffffffff834bba04@111fffffbd911aa0ffffffffd5637fff@ffffffff93f9086effffffffb4a239cd', 5);
INSERT INTO `sys_menu` VALUES ('ffffffff983d99e6ffffffff9a4c304c', '编辑', 'dictionary_row_edit', 2, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/edit', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffffdc83a84dffffffffe53ca925@ffffffff983d99e6ffffffff9a4c304c', 3);
INSERT INTO `sys_menu` VALUES ('ffffffff9db05c1000000000002e5179', '私有菜单(查询)', 'user_row_getOwnMenu', 1, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/getOwnMenu', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@ffffffff9db05c1000000000002e5179', 6);
INSERT INTO `sys_menu` VALUES ('ffffffff9dcbdcebffffffff99573f80', '私有菜单(保存)', 'user_row_saveOwnMenu', 4, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/saveOwnMenu', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@ffffffff9dcbdcebffffffff99573f80', 7);
INSERT INTO `sys_menu` VALUES ('ffffffffb71281a2ffffffffd931eb95', '删除(行内删除)', 'user_row_delById', 3, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/delById', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@ffffffffb71281a2ffffffffd931eb95', 4);
INSERT INTO `sys_menu` VALUES ('ffffffffc43097b8000000003a72e62f', '权限菜单', 'user_row_getMenuData', 1, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/getMenuData', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffff8c468a55ffffffff8f59d635@ffffffffc43097b8000000003a72e62f', 11);
INSERT INTO `sys_menu` VALUES ('ffffffffc9421e24ffffffffe4170035', '获取数据列表(搜索)', 'dictionary_btn_listData', 1, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/listData', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffffdc83a84dffffffffe53ca925@ffffffffc9421e24ffffffffe4170035', 1);
INSERT INTO `sys_menu` VALUES ('ffffffffdae3cd4affffffff9894b623', '角色菜单(查询)', 'role_row_getRoleMenu', 1, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/getRoleMenu', 0, 2, 'ffffffff8b559df0ffffffff834bba04@111fffffbd911aa0ffffffffd5637fff@ffffffffdae3cd4affffffff9894b623', 7);
INSERT INTO `sys_menu` VALUES ('ffffffffdc83a84dffffffffe53ca925', '数据字典', 'page:sys_dict', 1, 'menu-icon fa fa-caret-right', 'ffffffff8b559df0ffffffff834bba04', 'sys_dict.html', 0, 1, 'ffffffff8b559df0ffffffff834bba04@ffffffffdc83a84dffffffffe53ca925', 4);
INSERT INTO `sys_menu` VALUES ('ffffffffddf9f51ffffffffff6157ca3', '根据id获取详情', 'menu_row_queryById', 1, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/queryById', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@ffffffffddf9f51ffffffffff6157ca3', 6);
INSERT INTO `sys_menu` VALUES ('ffffffffdfaf333c000000001760f4a5', '编辑', 'role_row_edit', 2, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/edit', 0, 3, 'ffffffff8b559df0ffffffff834bba04@111fffffbd911aa0ffffffffd5637fff@ffffffffdfaf333c000000001760f4a5', 3);
INSERT INTO `sys_menu` VALUES ('ffffffffe56e8ef0ffffffff912af74a', '菜单管理', 'page_sys_menu', 1, 'menu-icon fa fa-caret-right', 'ffffffff8b559df0ffffffff834bba04', 'sys_menu.html', 0, 1, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a', 1);
INSERT INTO `sys_menu` VALUES ('fffffffff051bf04ffffffffa2ae3c8e', '获取树形菜单', 'menu_btn_queryTreeMenu', 1, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/queryTreeMenu', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@fffffffff051bf04ffffffffa2ae3c8e', 5);
INSERT INTO `sys_menu` VALUES ('fffffffffaad7649ffffffffe7c3d6a6', '获取数据列表(搜索)', 'role_btn_listData', 1, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/listData', 0, 2, 'ffffffff8b559df0ffffffff834bba04@111fffffbd911aa0ffffffffd5637fff@fffffffffaad7649ffffffffe7c3d6a6', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `role_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_flag` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色标识',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_role_name`(`role_name`) USING BTREE,
  UNIQUE INDEX `index_role_flag`(`role_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('000000003035dacf000000000c087217', '游客', 'ROLE_GUEST');
INSERT INTO `sys_role` VALUES ('ffffffffa04b32a6ffffffffba40a72e', '系统管理员', 'ROLE_ADMINISTRATORS');
INSERT INTO `sys_role` VALUES ('ffffffffdc2ebe6a000000006b149e18', '操作员', 'ROLE_OPERATOR');
INSERT INTO `sys_role` VALUES ('ffffffffde90da3fffffffffdef7150f', '管理员', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `role_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色的id(sys_role.kid)',
  `menu_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单的id(sys_menu.kid)',
  PRIMARY KEY (`kid`) USING BTREE,
  INDEX `index_role_menu`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限(菜单)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('ffffffff97394cc0ffffffffb945b845', 'ffffffffde90da3fffffffffdef7150f', '0000000006a9099300000000100d10cd');
INSERT INTO `sys_role_menu` VALUES ('000000003884f748ffffffff9ca7a8eb', 'ffffffffde90da3fffffffffdef7150f', '000000000ba93c43ffffffffe5c59508');
INSERT INTO `sys_role_menu` VALUES ('0000000072e8e493ffffffffad3f530b', 'ffffffffde90da3fffffffffdef7150f', '000000000ff54fcbffffffffbbe16acc');
INSERT INTO `sys_role_menu` VALUES ('000000002f84a2d5000000005a615f31', 'ffffffffde90da3fffffffffdef7150f', '000000002441c5fe000000005f6b6829');
INSERT INTO `sys_role_menu` VALUES ('000000001a202f7a000000000b509580', 'ffffffffde90da3fffffffffdef7150f', '000000002d8402d60000000072f7dea2');
INSERT INTO `sys_role_menu` VALUES ('0000000059a94f53000000002b1adbf3', 'ffffffffde90da3fffffffffdef7150f', '000000002e18cf48ffffffffab242e16');
INSERT INTO `sys_role_menu` VALUES ('ffffffff97e25b12fffffffff7995e41', 'ffffffffde90da3fffffffffdef7150f', '0000000035fbca03000000003a33d6b7');
INSERT INTO `sys_role_menu` VALUES ('0000000006ee2360ffffffffd69c3f7b', 'ffffffffde90da3fffffffffdef7150f', '000000003a56d4fb0000000037016444');
INSERT INTO `sys_role_menu` VALUES ('ffffffffe497718c0000000016026f67', 'ffffffffde90da3fffffffffdef7150f', '00000000545f18ddffffffff9482ed27');
INSERT INTO `sys_role_menu` VALUES ('000000007c6b50f70000000079b8d77c', 'ffffffffde90da3fffffffffdef7150f', '0000000058e2ec83000000002f978e03');
INSERT INTO `sys_role_menu` VALUES ('0000000048a0df3effffffff8b705138', 'ffffffffde90da3fffffffffdef7150f', '000000005c41138100000000288a6b45');
INSERT INTO `sys_role_menu` VALUES ('000000002c1d28b4000000004e7e37aa', 'ffffffffde90da3fffffffffdef7150f', '000000007330a2a9ffffffff98cebe66');
INSERT INTO `sys_role_menu` VALUES ('fffffffff111eb260000000046ecf14b', 'ffffffffde90da3fffffffffdef7150f', '0000000077224459ffffffffc9d752ca');
INSERT INTO `sys_role_menu` VALUES ('ffffffffacdf125fffffffffb6501035', 'ffffffffde90da3fffffffffdef7150f', '000000007937b8de0000000034ef3b70');
INSERT INTO `sys_role_menu` VALUES ('000000002396c8910000000047b4b3bd', 'ffffffffde90da3fffffffffdef7150f', '000000007a3bebc1ffffffffc0d19222');
INSERT INTO `sys_role_menu` VALUES ('ffffffff8f0bc7b8ffffffff9414a0df', 'ffffffffde90da3fffffffffdef7150f', '000000007ea75783000000004607fdec');
INSERT INTO `sys_role_menu` VALUES ('000000004c8454fd00000000436291ec', 'ffffffffde90da3fffffffffdef7150f', '111fffffbd911aa0ffffffffd5637fff');
INSERT INTO `sys_role_menu` VALUES ('ffffffffbd4c43b8ffffffffa882ce74', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff84e5da13fffffffface485ec');
INSERT INTO `sys_role_menu` VALUES ('ffffffff867817cd000000004e437fa0', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff87212d7d000000005fbd6e98');
INSERT INTO `sys_role_menu` VALUES ('000000007393ac530000000074657150', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff8b559df0ffffffff834bba04');
INSERT INTO `sys_role_menu` VALUES ('0000000051129d39ffffffffa0710bba', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff8c468a55ffffffff8f59d635');
INSERT INTO `sys_role_menu` VALUES ('000000006f07d1ca00000000144daaec', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff8e6151ff0000000015f6e145');
INSERT INTO `sys_role_menu` VALUES ('000000000eebe0ee00000000186c4de9', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff93f9086effffffffb4a239cd');
INSERT INTO `sys_role_menu` VALUES ('ffffffffbca26a96ffffffffeb988d64', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff983d99e6ffffffff9a4c304c');
INSERT INTO `sys_role_menu` VALUES ('ffffffffedf99babffffffffc032bd5d', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff9db05c1000000000002e5179');
INSERT INTO `sys_role_menu` VALUES ('ffffffffedda9a6bffffffff83f88883', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff9dcbdcebffffffff99573f80');
INSERT INTO `sys_role_menu` VALUES ('ffffffff965ffc1affffffffb300f656', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffb71281a2ffffffffd931eb95');
INSERT INTO `sys_role_menu` VALUES ('000000001628622b00000000769e0085', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffc43097b8000000003a72e62f');
INSERT INTO `sys_role_menu` VALUES ('ffffffffb4e6e2bd000000007e5cfa04', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffc9421e24ffffffffe4170035');
INSERT INTO `sys_role_menu` VALUES ('00000000652b4ff9fffffffff119c02a', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffdae3cd4affffffff9894b623');
INSERT INTO `sys_role_menu` VALUES ('0000000018a1a9b4fffffffff5cfe17c', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffdc83a84dffffffffe53ca925');
INSERT INTO `sys_role_menu` VALUES ('ffffffffad1ce419ffffffffbedccb6c', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffddf9f51ffffffffff6157ca3');
INSERT INTO `sys_role_menu` VALUES ('fffffffffb7a4f8300000000233744b7', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffdfaf333c000000001760f4a5');
INSERT INTO `sys_role_menu` VALUES ('000000006039eb0f000000006193bf87', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffe56e8ef0ffffffff912af74a');
INSERT INTO `sys_role_menu` VALUES ('000000004e56b56dffffffff9d113c95', 'ffffffffde90da3fffffffffdef7150f', 'fffffffff051bf04ffffffffa2ae3c8e');
INSERT INTO `sys_role_menu` VALUES ('00000000378c1532ffffffffa6d81965', 'ffffffffde90da3fffffffffdef7150f', 'fffffffffaad7649ffffffffe7c3d6a6');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `type` smallint UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户名|账号类型(1系统账号;2注册账号;)',
  `add_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `enabled` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否冻结（0正常1冻结）',
  `logintime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后登录时间',
  `times` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '已成功登录次数,默认为1，每次累加1',
  `error_count` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录错误次数',
  `error_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录登录错误的时刻',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('ffffffffddf9f1ffffffffff88888888', 'admin', 1, '2020-04-15 22:39:30', 0, '2020-08-26 09:14:07', 93, 0, '2020-08-26 09:14:07');

-- ----------------------------
-- Table structure for sys_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE `sys_user_menu`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户菜单(私有菜单)id',
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id(sys_user.kid)',
  `menu_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单id(sys_menu.kid)',
  PRIMARY KEY (`kid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户菜单(私有菜单)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_menu
-- ----------------------------
INSERT INTO `sys_user_menu` VALUES ('8b7aaa2c85ef11ea978d02004a400001', 'ffffffffab9fc98dffffffff8b642b39', 'ffffffff8b559df0ffffffff834bba04');
INSERT INTO `sys_user_menu` VALUES ('8b7aafaa85ef11ea978d02004a400001', 'ffffffffab9fc98dffffffff8b642b39', 'ffffffffe56e8ef0ffffffff912af74a');
INSERT INTO `sys_user_menu` VALUES ('8b7ab14485ef11ea978d02004a400001', 'ffffffffab9fc98dffffffff8b642b39', '0000000006a9099300000000100d10cd');
INSERT INTO `sys_user_menu` VALUES ('8b7ab24785ef11ea978d02004a400001', 'ffffffffab9fc98dffffffff8b642b39', '000000000ba93c43ffffffffe5c59508');
INSERT INTO `sys_user_menu` VALUES ('8b7ab2df85ef11ea978d02004a400001', 'ffffffffab9fc98dffffffff8b642b39', '000000005c41138100000000288a6b45');
INSERT INTO `sys_user_menu` VALUES ('8b7ab3a885ef11ea978d02004a400001', 'ffffffffab9fc98dffffffff8b642b39', '0000000058e2ec83000000002f978e03');
INSERT INTO `sys_user_menu` VALUES ('8b7ab44185ef11ea978d02004a400001', 'ffffffffab9fc98dffffffff8b642b39', 'fffffffff051bf04ffffffffa2ae3c8e');
INSERT INTO `sys_user_menu` VALUES ('f46b6f6fba9411ea940100505625d758', 'ffffffffddf9f1ffffffffff88888888', 'ffffffff8b559df0ffffffff834bba04');
INSERT INTO `sys_user_menu` VALUES ('f46b71b5ba9411ea940100505625d758', 'ffffffffddf9f1ffffffffff88888888', '111fffffbd911aa0ffffffffd5637fff');
INSERT INTO `sys_user_menu` VALUES ('f46b7233ba9411ea940100505625d758', 'ffffffffddf9f1ffffffffff88888888', 'ffffffffc5419f0cffffffffcb2c5e84');

-- ----------------------------
-- Table structure for sys_user_password
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_password`;
CREATE TABLE `sys_user_password`  (
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'user主键(sys_user.kid)',
  `user_password` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号密码',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `index_user_name`(`user_password`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户密码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_password
-- ----------------------------
INSERT INTO `sys_user_password` VALUES ('ffffffffddf9f1ffffffffff88888888', '$2a$10$2swupMvymbSVqW1qHWaxCuI4rv/Er6EdSqlVTKqe.wTqgGUGhLaDm');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名|账号的id(sys_user.kid)',
  `role_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色的id(sys_role.kid)',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_user_role`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('ffffffffa04b32a6ffffffffba40ffff', 'ffffffffddf9f1ffffffffff88888888', 'ffffffffa04b32a6ffffffffba40a72e');
INSERT INTO `sys_user_role` VALUES ('fffffffff051bf04ffffffffa2afffff', 'ffffffffddf9f1ffffffffff88888888', 'ffffffffde90da3fffffffffdef7150f');

-- ----------------------------
-- View structure for view_user_login
-- ----------------------------
DROP VIEW IF EXISTS `view_user_login`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_user_login` AS select `su`.`kid` AS `kid`,`su`.`user_name` AS `user_name`,`sup`.`user_password` AS `user_password`,`su`.`enabled` AS `enabled`,`su`.`error_count` AS `error_count`,`su`.`error_time` AS `error_time` from (`sys_user` `su` join `sys_user_password` `sup`) where (`su`.`kid` = `sup`.`user_id`);

SET FOREIGN_KEY_CHECKS = 1;
