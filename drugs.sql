--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: drugs1; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA drugs1;


ALTER SCHEMA drugs1 OWNER TO postgres;

--
-- Name: polish_ispell; Type: TEXT SEARCH DICTIONARY; Schema: public; Owner: postgres
--

CREATE TEXT SEARCH DICTIONARY public.polish_ispell (
    TEMPLATE = pg_catalog.ispell,
    dictfile = 'polish', afffile = 'polish', stopwords = 'polish' );


ALTER TEXT SEARCH DICTIONARY public.polish_ispell OWNER TO postgres;

--
-- Name: polish; Type: TEXT SEARCH CONFIGURATION; Schema: public; Owner: postgres
--

CREATE TEXT SEARCH CONFIGURATION public.polish (
    PARSER = pg_catalog."default" );

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR asciiword WITH public.polish_ispell;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR word WITH public.polish_ispell;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR numword WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR email WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR url WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR host WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR sfloat WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR version WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR hword_numpart WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR hword_part WITH public.polish_ispell;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR hword_asciipart WITH public.polish_ispell;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR numhword WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR asciihword WITH public.polish_ispell;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR hword WITH public.polish_ispell;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR url_path WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR file WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR "float" WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR "int" WITH simple;

ALTER TEXT SEARCH CONFIGURATION public.polish
    ADD MAPPING FOR uint WITH simple;


ALTER TEXT SEARCH CONFIGURATION public.polish OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: drugs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drugs (
    drugname character varying(255) NOT NULL,
    drugingredients character varying,
    drugindications character varying,
    drugdosage character varying,
    drugcontrindications character varying,
    drugwarnings character varying,
    druginteractions character varying,
    drugpregnancy character varying,
    drugadverse character varying,
    drugoverdose character varying,
    drugaction character varying,
    id integer NOT NULL
);


ALTER TABLE public.drugs OWNER TO postgres;

--
-- Name: drugs_favourites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drugs_favourites (
    id bigint NOT NULL,
    drugs_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.drugs_favourites OWNER TO postgres;

--
-- Name: drugs_favourites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drugs_favourites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drugs_favourites_id_seq OWNER TO postgres;

--
-- Name: drugs_favourites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drugs_favourites_id_seq OWNED BY public.drugs_favourites.id;


--
-- Name: drugs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drugs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drugs_id_seq OWNER TO postgres;

--
-- Name: drugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drugs_id_seq OWNED BY public.drugs.id;


--
-- Name: forum_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_author (
    id bigint NOT NULL,
    fullname character varying(50) NOT NULL,
    slug character varying(400) NOT NULL,
    bio text NOT NULL,
    points integer NOT NULL,
    profile_pic character varying(100),
    user_id integer NOT NULL
);


ALTER TABLE public.forum_author OWNER TO postgres;

--
-- Name: forum_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forum_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_author_id_seq OWNER TO postgres;

--
-- Name: forum_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forum_author_id_seq OWNED BY public.forum_author.id;


--
-- Name: forum_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_category (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    slug character varying(400) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.forum_category OWNER TO postgres;

--
-- Name: forum_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forum_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_category_id_seq OWNER TO postgres;

--
-- Name: forum_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forum_category_id_seq OWNED BY public.forum_category.id;


--
-- Name: forum_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_comment (
    id bigint NOT NULL,
    content text NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.forum_comment OWNER TO postgres;

--
-- Name: forum_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forum_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_comment_id_seq OWNER TO postgres;

--
-- Name: forum_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forum_comment_id_seq OWNED BY public.forum_comment.id;


--
-- Name: forum_comment_replies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_comment_replies (
    id bigint NOT NULL,
    comment_id bigint NOT NULL,
    reply_id bigint NOT NULL
);


ALTER TABLE public.forum_comment_replies OWNER TO postgres;

--
-- Name: forum_comment_reply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forum_comment_reply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_comment_reply_id_seq OWNER TO postgres;

--
-- Name: forum_comment_reply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forum_comment_reply_id_seq OWNED BY public.forum_comment_replies.id;


--
-- Name: forum_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_post (
    id bigint NOT NULL,
    title character varying(400) NOT NULL,
    slug character varying(400) NOT NULL,
    date timestamp with time zone NOT NULL,
    approved boolean NOT NULL,
    user_id bigint NOT NULL,
    closed boolean NOT NULL,
    content text NOT NULL,
    state character varying(40) NOT NULL
);


ALTER TABLE public.forum_post OWNER TO postgres;

--
-- Name: forum_post_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_post_categories (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.forum_post_categories OWNER TO postgres;

--
-- Name: forum_post_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forum_post_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_post_categories_id_seq OWNER TO postgres;

--
-- Name: forum_post_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forum_post_categories_id_seq OWNED BY public.forum_post_categories.id;


--
-- Name: forum_post_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_post_comments (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    comment_id bigint NOT NULL
);


ALTER TABLE public.forum_post_comments OWNER TO postgres;

--
-- Name: forum_post_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forum_post_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_post_comments_id_seq OWNER TO postgres;

--
-- Name: forum_post_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forum_post_comments_id_seq OWNED BY public.forum_post_comments.id;


--
-- Name: forum_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forum_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_post_id_seq OWNER TO postgres;

--
-- Name: forum_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forum_post_id_seq OWNED BY public.forum_post.id;


--
-- Name: forum_reply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_reply (
    id bigint NOT NULL,
    content text NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.forum_reply OWNER TO postgres;

--
-- Name: forum_reply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forum_reply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forum_reply_id_seq OWNER TO postgres;

--
-- Name: forum_reply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forum_reply_id_seq OWNED BY public.forum_reply.id;


--
-- Name: hitcount_blacklist_ip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hitcount_blacklist_ip (
    id bigint NOT NULL,
    ip character varying(40) NOT NULL
);


ALTER TABLE public.hitcount_blacklist_ip OWNER TO postgres;

--
-- Name: hitcount_blacklist_ip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hitcount_blacklist_ip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hitcount_blacklist_ip_id_seq OWNER TO postgres;

--
-- Name: hitcount_blacklist_ip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hitcount_blacklist_ip_id_seq OWNED BY public.hitcount_blacklist_ip.id;


--
-- Name: hitcount_blacklist_user_agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hitcount_blacklist_user_agent (
    id bigint NOT NULL,
    user_agent character varying(255) NOT NULL
);


ALTER TABLE public.hitcount_blacklist_user_agent OWNER TO postgres;

--
-- Name: hitcount_blacklist_user_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hitcount_blacklist_user_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hitcount_blacklist_user_agent_id_seq OWNER TO postgres;

--
-- Name: hitcount_blacklist_user_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hitcount_blacklist_user_agent_id_seq OWNED BY public.hitcount_blacklist_user_agent.id;


--
-- Name: hitcount_hit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hitcount_hit (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    ip character varying(40) NOT NULL,
    session character varying(40) NOT NULL,
    user_agent character varying(255) NOT NULL,
    hitcount_id bigint NOT NULL,
    user_id integer
);


ALTER TABLE public.hitcount_hit OWNER TO postgres;

--
-- Name: hitcount_hit_count; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hitcount_hit_count (
    id bigint NOT NULL,
    hits integer NOT NULL,
    modified timestamp with time zone NOT NULL,
    object_pk integer NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT hitcount_hit_count_hits_check CHECK ((hits >= 0)),
    CONSTRAINT hitcount_hit_count_object_pk_53e9c38f_check CHECK ((object_pk >= 0))
);


ALTER TABLE public.hitcount_hit_count OWNER TO postgres;

--
-- Name: hitcount_hit_count_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hitcount_hit_count_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hitcount_hit_count_id_seq OWNER TO postgres;

--
-- Name: hitcount_hit_count_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hitcount_hit_count_id_seq OWNED BY public.hitcount_hit_count.id;


--
-- Name: hitcount_hit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hitcount_hit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hitcount_hit_id_seq OWNER TO postgres;

--
-- Name: hitcount_hit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hitcount_hit_id_seq OWNED BY public.hitcount_hit.id;


--
-- Name: index_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.index_comment (
    id bigint NOT NULL,
    body text NOT NULL,
    date_added timestamp with time zone NOT NULL,
    drug_id bigint NOT NULL,
    name_id integer NOT NULL
);


ALTER TABLE public.index_comment OWNER TO postgres;

--
-- Name: index_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.index_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.index_comment_id_seq OWNER TO postgres;

--
-- Name: index_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.index_comment_id_seq OWNED BY public.index_comment.id;


--
-- Name: index_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.index_post (
    id bigint NOT NULL,
    body text NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.index_post OWNER TO postgres;

--
-- Name: index_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.index_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.index_post_id_seq OWNER TO postgres;

--
-- Name: index_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.index_post_id_seq OWNED BY public.index_post.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: users_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_profile (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_profile OWNER TO postgres;

--
-- Name: users_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profile_id_seq OWNER TO postgres;

--
-- Name: users_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_profile_id_seq OWNED BY public.users_profile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: drugs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs ALTER COLUMN id SET DEFAULT nextval('public.drugs_id_seq'::regclass);


--
-- Name: drugs_favourites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs_favourites ALTER COLUMN id SET DEFAULT nextval('public.drugs_favourites_id_seq'::regclass);


--
-- Name: forum_author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_author ALTER COLUMN id SET DEFAULT nextval('public.forum_author_id_seq'::regclass);


--
-- Name: forum_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_category ALTER COLUMN id SET DEFAULT nextval('public.forum_category_id_seq'::regclass);


--
-- Name: forum_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_comment ALTER COLUMN id SET DEFAULT nextval('public.forum_comment_id_seq'::regclass);


--
-- Name: forum_comment_replies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_comment_replies ALTER COLUMN id SET DEFAULT nextval('public.forum_comment_reply_id_seq'::regclass);


--
-- Name: forum_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post ALTER COLUMN id SET DEFAULT nextval('public.forum_post_id_seq'::regclass);


--
-- Name: forum_post_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post_categories ALTER COLUMN id SET DEFAULT nextval('public.forum_post_categories_id_seq'::regclass);


--
-- Name: forum_post_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post_comments ALTER COLUMN id SET DEFAULT nextval('public.forum_post_comments_id_seq'::regclass);


--
-- Name: forum_reply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_reply ALTER COLUMN id SET DEFAULT nextval('public.forum_reply_id_seq'::regclass);


--
-- Name: hitcount_blacklist_ip id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_blacklist_ip ALTER COLUMN id SET DEFAULT nextval('public.hitcount_blacklist_ip_id_seq'::regclass);


--
-- Name: hitcount_blacklist_user_agent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_blacklist_user_agent ALTER COLUMN id SET DEFAULT nextval('public.hitcount_blacklist_user_agent_id_seq'::regclass);


--
-- Name: hitcount_hit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_hit ALTER COLUMN id SET DEFAULT nextval('public.hitcount_hit_id_seq'::regclass);


--
-- Name: hitcount_hit_count id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_hit_count ALTER COLUMN id SET DEFAULT nextval('public.hitcount_hit_count_id_seq'::regclass);


--
-- Name: index_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.index_comment ALTER COLUMN id SET DEFAULT nextval('public.index_comment_id_seq'::regclass);


--
-- Name: index_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.index_post ALTER COLUMN id SET DEFAULT nextval('public.index_post_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: users_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile ALTER COLUMN id SET DEFAULT nextval('public.users_profile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add drugs	1	add_drugs
2	Can change drugs	1	change_drugs
3	Can delete drugs	1	delete_drugs
4	Can view drugs	1	view_drugs
5	Can add log entry	2	add_logentry
6	Can change log entry	2	change_logentry
7	Can delete log entry	2	delete_logentry
8	Can view log entry	2	view_logentry
9	Can add permission	3	add_permission
10	Can change permission	3	change_permission
11	Can delete permission	3	delete_permission
12	Can view permission	3	view_permission
13	Can add group	4	add_group
14	Can change group	4	change_group
15	Can delete group	4	delete_group
16	Can view group	4	view_group
17	Can add user	5	add_user
18	Can change user	5	change_user
19	Can delete user	5	delete_user
20	Can view user	5	view_user
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
29	Can add post	8	add_post
30	Can change post	8	change_post
31	Can delete post	8	delete_post
32	Can view post	8	view_post
33	Can add comment	9	add_comment
34	Can change comment	9	change_comment
35	Can delete comment	9	delete_comment
36	Can view comment	9	view_comment
37	Can add fav	10	add_fav
38	Can change fav	10	change_fav
39	Can delete fav	10	delete_fav
40	Can view fav	10	view_fav
41	Can add profile	11	add_profile
42	Can change profile	11	change_profile
43	Can delete profile	11	delete_profile
44	Can view profile	11	view_profile
45	Can add author	12	add_author
46	Can change author	12	change_author
47	Can delete author	12	delete_author
48	Can view author	12	view_author
49	Can add category	13	add_category
50	Can change category	13	change_category
51	Can delete category	13	delete_category
52	Can view category	13	view_category
53	Can add post	14	add_post
54	Can change post	14	change_post
55	Can delete post	14	delete_post
56	Can view post	14	view_post
57	Can add Blacklisted IP	15	add_blacklistip
58	Can change Blacklisted IP	15	change_blacklistip
59	Can delete Blacklisted IP	15	delete_blacklistip
60	Can view Blacklisted IP	15	view_blacklistip
61	Can add Blacklisted User Agent	16	add_blacklistuseragent
62	Can change Blacklisted User Agent	16	change_blacklistuseragent
63	Can delete Blacklisted User Agent	16	delete_blacklistuseragent
64	Can view Blacklisted User Agent	16	view_blacklistuseragent
65	Can add hit	17	add_hit
66	Can change hit	17	change_hit
67	Can delete hit	17	delete_hit
68	Can view hit	17	view_hit
69	Can add hit count	18	add_hitcount
70	Can change hit count	18	change_hitcount
71	Can delete hit count	18	delete_hitcount
72	Can view hit count	18	view_hitcount
73	Can add tag	19	add_tag
74	Can change tag	19	change_tag
75	Can delete tag	19	delete_tag
76	Can view tag	19	view_tag
77	Can add tagged item	20	add_taggeditem
78	Can change tagged item	20	change_taggeditem
79	Can delete tagged item	20	delete_taggeditem
80	Can view tagged item	20	view_taggeditem
81	Can add reply	21	add_reply
82	Can change reply	21	change_reply
83	Can delete reply	21	delete_reply
84	Can view reply	21	view_reply
85	Can add comment	22	add_comment
86	Can change comment	22	change_comment
87	Can delete comment	22	delete_comment
88	Can view comment	22	view_comment
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$260000$JbPFPbDCGFg1ayKM17YTYF$LCjhe9C2FZgkdjlCtkH5ChzVrijpb7i2m7IP/6u5O1I=	2021-09-13 16:17:33.514651+02	f	UzytkownikTest1a			UzytkownikTest1a@uzytkownik.com	f	t	2021-09-12 19:17:46.874534+02
1	pbkdf2_sha256$260000$9esWza1BaromqkFKdSqwYo$a8UbTwtao9PSrssaetROiCGZFj7oJTf9Ph/Pw/+7cIE=	2022-01-09 14:54:07.772128+01	t	Marcin			35891@gumed.edu.pl	t	t	2021-09-06 18:10:55.965753+02
6	pbkdf2_sha256$260000$tp0EDolMgiO9VOp4tDqzYR$z4Wt0wuGo6/J2t4KzFU9X0ZLuIZlE/069tUGaJgj6Xg=	2021-09-28 20:28:18.673401+02	f	UzytkownikTest1			UzytkownikTest1@uzytkownik.com	f	t	2021-09-28 19:39:13.894013+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-09-09 14:49:50.643707+02	2	Drugs object (1) - Marcin	1	[{"added": {}}]	9	1
2	2021-09-09 15:01:08.069725+02	3	Bixebra - Marcin	1	[{"added": {}}]	9	1
3	2021-09-09 15:01:33.905441+02	4	Cannabis sativa L., Red No 2 - Marcin	1	[{"added": {}}]	9	1
4	2021-09-09 15:01:58.115343+02	4	Cannabis sativa L., Red No 2 - Marcin	3		9	1
5	2021-09-09 15:01:58.121885+02	3	Bixebra - Marcin	3		9	1
6	2021-09-09 15:01:58.123594+02	2	Akustone™ - Marcin	3		9	1
7	2021-09-09 15:03:42.63467+02	5	Bixebra - Marcin	1	[{"added": {}}]	9	1
8	2021-09-09 15:03:49.198149+02	5	Bixebra - Marcin	3		9	1
9	2021-09-09 15:27:14.447332+02	6	Akustone™ - Marcin	1	[{"added": {}}]	9	1
10	2021-09-09 15:31:43.904628+02	6	Akustone™ - Marcin	2	[{"changed": {"fields": ["Body"]}}]	9	1
11	2021-09-09 15:43:51.957634+02	6	Akustone™ - Marcin	2	[{"changed": {"fields": ["Body"]}}]	9	1
12	2021-09-09 15:48:18.681907+02	6	Akustone™ - Marcin	2	[{"changed": {"fields": ["Body"]}}]	9	1
13	2021-09-09 15:53:39.102901+02	7	Akustone™ - UzytkownikTest1	1	[{"added": {}}]	9	1
14	2021-09-10 10:17:12.139696+02	8	Akustone™ - Marcin	1	[{"added": {}}]	9	1
15	2021-09-10 10:19:06.797069+02	9	Akustone™ - Marcin	1	[{"added": {}}]	9	1
16	2021-09-10 10:19:23.608758+02	6	Akustone™ - Marcin	3		9	1
17	2021-09-10 10:19:23.614885+02	7	Akustone™ - UzytkownikTest1	3		9	1
18	2021-09-10 10:19:23.616802+02	8	Akustone™ - Marcin	3		9	1
19	2021-09-10 10:19:23.617864+02	9	Akustone™ - Marcin	3		9	1
20	2021-09-10 10:19:33.523086+02	10	Akustone™ - Marcin	1	[{"added": {}}]	9	1
21	2021-09-10 10:19:47.463788+02	11	Akustone™ - UzytkownikTest1	1	[{"added": {}}]	9	1
22	2021-09-10 10:20:29.718768+02	12	Akustone™ - Marcin	1	[{"added": {}}]	9	1
23	2021-09-10 15:05:03.863226+02	28	Akustone™ - Marcin	3		9	1
24	2021-09-10 15:05:03.867052+02	27	Akustone™ - Marcin	3		9	1
25	2021-09-10 15:05:03.868078+02	26	Cannabis sativa L., Red No 2 - Marcin	3		9	1
26	2021-09-10 15:05:03.869063+02	25	Cannabis sativa L., Red No 2 - Marcin	3		9	1
27	2021-09-10 15:05:03.870063+02	24	Akustone™ - Marcin	3		9	1
28	2021-09-10 15:05:03.871734+02	23	Akustone™ - Marcin	3		9	1
29	2021-09-10 15:05:03.873138+02	22	Akustone™ - Marcin	3		9	1
30	2021-09-10 15:05:03.87375+02	21	Akustone™ - Marcin	3		9	1
31	2021-09-10 15:05:03.874405+02	20	Akustone™ - Marcin	3		9	1
32	2021-09-10 15:05:03.875034+02	19	Akustone™ - Marcin	3		9	1
33	2021-09-10 15:05:03.875636+02	18	Akustone™ - Marcin	3		9	1
34	2021-09-10 15:05:03.876271+02	17	Akustone™ - Marcin	3		9	1
35	2021-09-10 15:05:03.87709+02	16	Cannabis sativa L., Red No 2 - Marcin	3		9	1
36	2021-09-10 15:05:03.877751+02	15	Akustone™ - Marcin	3		9	1
37	2021-09-10 15:05:03.878321+02	12	Akustone™ - Marcin	3		9	1
38	2021-09-10 15:05:03.878875+02	11	Akustone™ - UzytkownikTest1	3		9	1
39	2021-09-10 15:05:03.879347+02	10	Akustone™ - Marcin	3		9	1
40	2021-09-10 16:13:10.646447+02	1	Akustone™ - Marcin	1	[{"added": {}}]	10	1
41	2021-09-10 16:20:37.135372+02	2	Akustone™ - Marcin	1	[{"added": {}}]	10	1
42	2021-09-10 16:21:36.20501+02	2	Akustone™ - Marcin	3		10	1
43	2021-09-12 15:21:50.576494+02	2	UzytkownikTest1	3		5	1
44	2021-09-12 16:13:53.431444+02	1	Profil Marcin	1	[{"added": {}}]	11	1
45	2021-09-12 16:16:09.718382+02	2	Profil użytkownika UzytkownikTest2	1	[{"added": {}}]	11	1
46	2021-09-12 16:26:55.138195+02	2	Profil użytkownika UzytkownikTest2	3		11	1
47	2021-09-12 16:26:55.144246+02	1	Profil użytkownika Marcin	3		11	1
48	2021-09-12 16:27:09.849022+02	3	Profil użytkownika Marcin	1	[{"added": {}}]	11	1
49	2021-09-12 16:27:49.915643+02	4	Profil użytkownika UzytkownikTest2	1	[{"added": {}}]	11	1
50	2021-09-13 16:16:05.867683+02	6	Profil użytkownika UzytkownikTest5uktualizacja	3		11	1
51	2021-09-13 16:16:05.873542+02	4	Profil użytkownika UzytkownikTest2a	3		11	1
52	2021-09-13 16:16:41.403889+02	3	UzytkownikTest2a	3		5	1
53	2021-09-13 16:16:41.408088+02	5	UzytkownikTest5uktualizacja	3		5	1
54	2021-09-17 15:20:52.391871+02	1	bixebra	1	[{"added": {}}]	13	1
55	2021-09-17 15:27:17.064095+02	1	Marcin K	1	[{"added": {}}]	12	1
56	2021-09-17 15:46:37.334659+02	1	bixebra	3		13	1
57	2021-09-17 15:56:54.065777+02	2	bixebra	1	[{"added": {}}]	13	1
58	2021-09-17 16:15:39.713933+02	1	asAs	1	[{"added": {}}]	22	1
59	2021-09-17 16:15:46.514195+02	1	asAsa	1	[{"added": {}}]	21	1
60	2021-09-17 16:31:49.796427+02	1	bixebra	1	[{"added": {}}]	14	1
61	2021-09-17 17:25:58.463906+02	1	Marcin K	2	[{"changed": {"fields": ["Profile pic"]}}]	12	1
62	2021-09-17 17:54:52.990959+02	1	bixebra	2	[{"changed": {"fields": ["Approved"]}}]	14	1
63	2021-09-17 17:55:33.211529+02	8	aaaa	2	[{"changed": {"fields": ["Content", "Categories", "Approved", "Tags"]}}]	14	1
64	2021-09-17 17:55:49.105666+02	2	wdasd	2	[{"changed": {"fields": ["Content", "Categories", "Approved", "Tags", "Comments"]}}]	14	1
65	2021-09-17 18:27:01.589178+02	3	akustone	1	[{"added": {}}]	13	1
66	2021-09-17 18:33:41.034062+02	14	a	2	[{"changed": {"fields": ["Content", "Categories", "Tags", "Comments"]}}]	14	1
67	2021-09-17 20:50:04.336048+02	10	TestPostFront12	2	[{"changed": {"fields": ["Content", "Categories", "Approved", "Tags", "Comments"]}}]	14	1
68	2021-09-17 20:50:54.514369+02	10	TestPostFront12	2	[{"changed": {"fields": ["Closed"]}}]	14	1
69	2021-09-17 20:56:55.430839+02	2	llkklol	1	[{"added": {}}]	21	1
70	2021-09-28 18:19:54.054642+02	2	Marcin	1	[{"added": {}}]	12	1
71	2021-09-28 19:21:13.969515+02	1	Marcin K	3		12	1
72	2021-09-28 19:24:12.766932+02	2	Marcin	2	[{"changed": {"fields": ["Profile pic"]}}]	12	1
73	2021-09-28 20:25:37.860474+02	3		1	[{"added": {}}]	12	1
74	2021-09-28 20:26:57.095207+02	3		3		12	1
75	2021-09-28 20:27:10.998659+02	4		1	[{"added": {}}]	12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	index	drugs
2	admin	logentry
3	auth	permission
4	auth	group
5	auth	user
6	contenttypes	contenttype
7	sessions	session
8	index	post
9	index	comment
10	index	fav
11	users	profile
12	forum	author
13	forum	category
14	forum	post
15	hitcount	blacklistip
16	hitcount	blacklistuseragent
17	hitcount	hit
18	hitcount	hitcount
19	taggit	tag
20	taggit	taggeditem
21	forum	reply
22	forum	comment
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-09-06 17:55:42.128119+02
2	auth	0001_initial	2021-09-06 17:55:42.243381+02
3	admin	0001_initial	2021-09-06 17:55:42.259034+02
4	admin	0002_logentry_remove_auto_add	2021-09-06 17:55:42.259034+02
5	admin	0003_logentry_add_action_flag_choices	2021-09-06 17:55:42.274655+02
6	contenttypes	0002_remove_content_type_name	2021-09-06 17:55:42.290258+02
7	auth	0002_alter_permission_name_max_length	2021-09-06 17:55:42.290258+02
8	auth	0003_alter_user_email_max_length	2021-09-06 17:55:42.305968+02
9	auth	0004_alter_user_username_opts	2021-09-06 17:55:42.305968+02
10	auth	0005_alter_user_last_login_null	2021-09-06 17:55:42.305968+02
11	auth	0006_require_contenttypes_0002	2021-09-06 17:55:42.305968+02
12	auth	0007_alter_validators_add_error_messages	2021-09-06 17:55:42.321562+02
13	auth	0008_alter_user_username_max_length	2021-09-06 17:55:42.337129+02
14	auth	0009_alter_user_last_name_max_length	2021-09-06 17:55:42.337129+02
15	auth	0010_alter_group_name_max_length	2021-09-06 17:55:42.352788+02
16	auth	0011_update_proxy_permissions	2021-09-06 17:55:42.352788+02
17	auth	0012_alter_user_first_name_max_length	2021-09-06 17:55:42.368375+02
18	index	0001_initial	2021-09-06 17:55:42.368375+02
19	sessions	0001_initial	2021-09-06 17:55:42.385678+02
20	index	0002_post	2021-09-09 12:55:27.56441+02
21	index	0003_comment	2021-09-09 14:43:09.127921+02
22	index	0004_alter_comment_name	2021-09-09 14:43:09.163355+02
23	index	0005_alter_comment_name	2021-09-09 14:43:09.197242+02
24	index	0006_auto_20210910_1612	2021-09-10 16:12:36.890829+02
25	index	0007_delete_fav	2021-09-10 16:38:04.364069+02
26	index	0008_fav	2021-09-10 17:05:54.660601+02
27	index	0009_delete_fav	2021-09-10 17:22:42.847166+02
28	index	0010_alter_drugs_options	2021-09-10 17:49:52.96372+02
29	index	0011_alter_drugs_options	2021-09-10 17:49:52.967709+02
30	index	0012_alter_drugs_options	2021-09-10 17:51:18.582247+02
31	index	0013_drugs_favourites	2021-09-10 17:51:39.576936+02
32	index	0014_alter_drugs_options	2021-09-10 17:52:02.52114+02
33	users	0001_initial	2021-09-12 16:06:45.713558+02
34	forum	0001_initial	2021-09-15 14:03:37.162904+02
35	hitcount	0001_initial	2021-09-15 14:03:37.273316+02
36	hitcount	0002_index_ip_and_session	2021-09-15 14:03:37.305633+02
37	hitcount	0003_auto_20190608_1004	2021-09-15 14:03:37.358964+02
38	hitcount	0004_auto_20200704_0933	2021-09-15 14:03:37.379738+02
39	hitcount	0005_auto_20210915_1401	2021-09-15 14:03:37.528505+02
40	taggit	0001_initial	2021-09-15 14:03:37.593869+02
41	taggit	0002_auto_20150616_2121	2021-09-15 14:03:37.609522+02
42	taggit	0003_taggeditem_add_unique_index	2021-09-15 14:03:37.625177+02
43	users	0002_alter_profile_image	2021-09-15 14:03:37.625177+02
44	forum	0002_category_description	2021-09-15 16:25:33.60031+02
45	forum	0003_auto_20210915_1706	2021-09-15 17:06:50.326858+02
46	forum	0004_auto_20210917_1631	2021-09-17 16:31:19.568402+02
47	forum	0005_alter_author_profile_pic	2021-09-17 17:19:49.760751+02
48	forum	0006_alter_author_profile_pic	2021-09-17 17:23:50.503205+02
49	forum	0007_alter_post_approved	2021-09-17 18:30:45.825934+02
50	forum	0008_rename_reply_comment_replies	2021-09-17 21:14:36.536191+02
51	forum	0009_auto_20210928_1826	2021-09-28 18:27:07.664802+02
52	forum	0010_alter_author_bio	2021-09-28 20:25:32.233779+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2kw9rk38oql1j7w6q5oxs67pbml4awgc	.eJxVjMEOgjAQBf-lZ9O4FKh49M43NLvtW4uaklA4Gf_dkHDQ68xk3ibwtuawVSxhSuZqGnP6ZcLxibKL9OByn22cy7pMYvfEHrbacU543Y72b5C55n3r-7Oyat_Bq6NLcsrMiQEkaSkS0DmIKoHi0JJjcvBd24tDM4iYzxcj7zl1:1mOk1V:gn6xyAR4T_nObFsr9suRnZPMtK_l3Q5IcCGJefzOO1U	2021-09-24 19:09:09.251594+02
4bh1zyca6ymubjxviz6ld5y01nyl3zqj	.eJxVjMEOgjAQBf-lZ9O4FKh49M43NLvtW4uaklA4Gf_dkHDQ68xk3ibwtuawVSxhSuZqGnP6ZcLxibKL9OByn22cy7pMYvfEHrbacU543Y72b5C55n3r-7Oyat_Bq6NLcsrMiQEkaSkS0DmIKoHi0JJjcvBd24tDM4iYzxcj7zl1:1mOwzl:T1zNzanf3TJS0UDtQujuIWIzEdn0tvR0WJX-jAvk60E	2021-09-25 09:00:13.213831+02
az1vwbjy1fmtbajsai2hudef6ykh37dd	.eJxVjEEOwiAQRe_C2pCBGYq4dO8ZmoFBqRpISrsy3l2bdKHb_977LzXyupRx7XkeJ1EnZdThd4ucHrluQO5cb02nVpd5inpT9E67vjTJz_Pu_h0U7uVbE2HKiB6QkhFhF2IO3nrP0QZ7dQMhIvgkAChHYmdjJBMSgGECGNT7A8VLNr4:1mPpv3:Bumwxn7D41qYZuhwIv5ZSp1OcLkiJEqGTSEGbbCp0ok	2021-09-27 19:39:01.420214+02
lww9157n3204obqsrplv73fu1o57vgqx	.eJxVjEEOwiAQRe_C2pCBGYq4dO8ZmoFBqRpISrsy3l2bdKHb_977LzXyupRx7XkeJ1EnZdThd4ucHrluQO5cb02nVpd5inpT9E67vjTJz_Pu_h0U7uVbE2HKiB6QkhFhF2IO3nrP0QZ7dQMhIvgkAChHYmdjJBMSgGECGNT7A8VLNr4:1mQth2:FZAaASegkUveI8QteVZyDxxyxfYe4oa0EFimHE-lpRI	2021-09-30 17:52:56.966219+02
awecbunjhh6i7tjq8pr0esvhrnmmiqkh	.eJxVjEEOwiAQRe_C2pCBGYq4dO8ZmoFBqRpISrsy3l2bdKHb_977LzXyupRx7XkeJ1EnZdThd4ucHrluQO5cb02nVpd5inpT9E67vjTJz_Pu_h0U7uVbE2HKiB6QkhFhF2IO3nrP0QZ7dQMhIvgkAChHYmdjJBMSgGECGNT7A8VLNr4:1mRAAu:mKwvQgblnuLSk8k0pey6Athat-7zcCWUiZbaw0VniDI	2021-10-01 11:28:52.945654+02
eqtv6y4cnjr81pzumv9tuiqlqos0r04q	.eJxVjDsOwjAQBe_iGlkbr_GHkp4zWOv1ggPIkeKkQtwdIqWA9s3Me6lE61LT2mVOY1EnNajD75aJH9I2UO7UbpPmqS3zmPWm6J12fZmKPM-7-3dQqddvbSMwBBZkEJsBrIdg_BG5RMYhCgaOWAANoyd3BScuWGNRAjlk59X7A8I3NuE:1mOLEx:h0DTh-k9uZ0PVLjEJ8bOZKYTsMuJgtjBdoxWkSLyQdg	2021-09-23 16:41:23.132304+02
t4gujyubg40lknsxjvfs9hrqgg2v9uf7	.eJxVjEEOwiAQRe_C2pCBGYq4dO8ZmoFBqRpISrsy3l2bdKHb_977LzXyupRx7XkeJ1EnZdThd4ucHrluQO5cb02nVpd5inpT9E67vjTJz_Pu_h0U7uVbE2HKiB6QkhFhF2IO3nrP0QZ7dQMhIvgkAChHYmdjJBMSgGECGNT7A8VLNr4:1mRUep:PsCyiD_2TZEhhMqidP79cNBAvBfBwnrHBbrT8lJwkVE	2021-10-02 09:21:07.543184+02
buve1kfyok6qxcn16t98mt9u3gcma43k	.eJxVjDsOwjAQBe_iGlkbr_GHkp4zWOv1ggPIkeKkQtwdIqWA9s3Me6lE61LT2mVOY1EnNajD75aJH9I2UO7UbpPmqS3zmPWm6J12fZmKPM-7-3dQqddvbSMwBBZkEJsBrIdg_BG5RMYhCgaOWAANoyd3BScuWGNRAjlk59X7A8I3NuE:1mPTqQ:u0Ccb48aoGHkP7F_oY-h6QsXnP9EH7DH6qVAC7f5iBw	2021-09-26 20:04:46.271499+02
7vm2oph3k2rvp5t5muifutwgj8z7mxcj	.eJxVjEEOwiAQRe_C2pCBGYq4dO8ZmoFBqRpISrsy3l2bdKHb_977LzXyupRx7XkeJ1EnZdThd4ucHrluQO5cb02nVpd5inpT9E67vjTJz_Pu_h0U7uVbE2HKiB6QkhFhF2IO3nrP0QZ7dQMhIvgkAChHYmdjJBMSgGECGNT7A8VLNr4:1mVTg2:IIWvZ9cHC7qRsyL3TZrwIkakEWYNhjVcafBbf6W_HhQ	2021-10-13 09:06:50.840024+02
w02b6q3pagvcplplibm44zabdpsrp4ix	.eJxVjEEOwiAQRe_C2pCBGYq4dO8ZmoFBqRpISrsy3l2bdKHb_977LzXyupRx7XkeJ1EnZdThd4ucHrluQO5cb02nVpd5inpT9E67vjTJz_Pu_h0U7uVbE2HKiB6QkhFhF2IO3nrP0QZ7dQMhIvgkAChHYmdjJBMSgGECGNT7A8VLNr4:1mVWHX:NAzllzW8KVIR1q1X0WJhd60cN6kmp5XNibNNzkkn2sY	2021-10-13 11:53:43.937873+02
50tyhhmpttu1y0hyaih1j6l49vryzahu	.eJxVjEEOwiAQRe_C2pCBGYq4dO8ZmoFBqRpISrsy3l2bdKHb_977LzXyupRx7XkeJ1EnZdThd4ucHrluQO5cb02nVpd5inpT9E67vjTJz_Pu_h0U7uVbE2HKiB6QkhFhF2IO3nrP0QZ7dQMhIvgkAChHYmdjJBMSgGECGNT7A8VLNr4:1mf6So:V1gLHbCLe1_OCRZmZcUEk4Q0vX7tntOCP5JdukZI1go	2021-11-08 21:20:58.88778+01
5zgul187chlrdirgu7l1uth944j0d719	.eJxVjEEOwiAQRe_C2hBKB8q4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWgzj9boHig-sO0p3qrcnY6rrMQe6KPGiX15b4eTncv4NCvXxrsE4ZAhiBx-TIQtSAEHIix4OlrNKEZBxrRjthdoad0hgJNSGNMYr3B9UQN-w:1mglHl:KGXI8bX0NwsOdWK_IVQvjEKRb7rCPLKWUDz1MsgevTI	2021-11-13 11:08:25.405693+01
pkm1rasv5ucnihiby6gls4ocy6itbgvl	.eJxVjEEOwiAQRe_C2hBKB8q4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWgzj9boHig-sO0p3qrcnY6rrMQe6KPGiX15b4eTncv4NCvXxrsE4ZAhiBx-TIQtSAEHIix4OlrNKEZBxrRjthdoad0hgJNSGNMYr3B9UQN-w:1mqy7i:U3bIW7dPHg5xsJBtq-lxwEXIrWQrIDjekmNOw-6fxfA	2021-12-11 14:52:14.780067+01
pd1fj1o8yqew76dkd8d50nzt16j1hzd4	.eJxVjEEOwiAQRe_C2hBKB8q4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWgzj9boHig-sO0p3qrcnY6rrMQe6KPGiX15b4eTncv4NCvXxrsE4ZAhiBx-TIQtSAEHIix4OlrNKEZBxrRjthdoad0hgJNSGNMYr3B9UQN-w:1n2dHj:LSqnfyex3hV-P-fTyZ5WJ5mhZsGac7jhGObJsAdPr7A	2022-01-12 19:02:47.190433+01
4jtmyl04jcfv5br1zwff92cbj6h3m33l	.eJxVjEEOwiAQRe_C2hBKB8q4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWgzj9boHig-sO0p3qrcnY6rrMQe6KPGiX15b4eTncv4NCvXxrsE4ZAhiBx-TIQtSAEHIix4OlrNKEZBxrRjthdoad0hgJNSGNMYr3B9UQN-w:1n3fDC:w60e2M_63JxgXCD1P4sb5uYeVmhWo7BNyOPZktgo7xk	2022-01-15 15:18:22.314418+01
eceb3ndqv6cfjds4scntw2m69tc8vgm4	.eJxVjEEOwiAQRe_C2hBKB8q4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWgzj9boHig-sO0p3qrcnY6rrMQe6KPGiX15b4eTncv4NCvXxrsE4ZAhiBx-TIQtSAEHIix4OlrNKEZBxrRjthdoad0hgJNSGNMYr3B9UQN-w:1n3lSF:d38RUDrs8U5L4FhYkjr2jE_-YOKVDda4oFQU_0QBYsI	2022-01-15 21:58:19.360335+01
kffsmq1p173fjh8mt00zo9mvk6fke7ji	eyJfcGFzc3dvcmRfcmVzZXRfdG9rZW4iOiJheW1oeGktZjhiMzkwMzNhYzcxNDcwMjc0MzM1OTRlMGQ5NDRmYTUifQ:1n3yni:_ohptwgaj6ID3au3w1QY0yb-2ixUTNhYK7D9fgwVRMw	2022-01-16 12:13:22.287059+01
anlrxj5zhxznh9h7u6jwq7dr1mx9so7c	.eJxVjEEOwiAQRe_C2hBKB8q4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWgzj9boHig-sO0p3qrcnY6rrMQe6KPGiX15b4eTncv4NCvXxrsE4ZAhiBx-TIQtSAEHIix4OlrNKEZBxrRjthdoad0hgJNSGNMYr3B9UQN-w:1n6YaI:KlfAzDSWjEMva-p-adjXnMBUZOuNmPTAsfwFI1wxgBI	2022-01-23 14:50:10.807391+01
ixtn5lvf2q8elrdnwndq61v4mndez3bz	.eJxVjEEOwiAQRe_C2hBKB8q4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWgzj9boHig-sO0p3qrcnY6rrMQe6KPGiX15b4eTncv4NCvXxrsE4ZAhiBx-TIQtSAEHIix4OlrNKEZBxrRjthdoad0hgJNSGNMYr3B9UQN-w:1n6Ye7:sudLesBWez4vhxUriD3f2X3rip39WzsR5ZZj-FQ7x0A	2022-01-23 14:54:07.790149+01
\.


--
-- Data for Name: drugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drugs (drugname, drugingredients, drugindications, drugdosage, drugcontrindications, drugwarnings, druginteractions, drugpregnancy, drugadverse, drugoverdose, drugaction, id) FROM stdin;
Akustone™	brak danych	Wyrób medyczny zawiera: oliwę z oliwek, olej migdałowy, olej jojoba, parafinę ciekłą, wit. E, polisorbat 80. Wyrób medyczny przeznaczony do higieny uszu, który pomaga usuwać korki woskowinowe oraz przeciwdziałać ich powstawaniu. Zawiera m.in. aż 3 naturalne oleje: jojoba, migdałowy, oliwę z oliwek. Wyrób medyczny rozpuszcza zalegającą woskowinę; przeciwdziała powstawaniu korków woskowinowych; umożliwia zachowanie właściwej higieny uszu w przypadku nadmiernej produkcji woskowiny u dzieci lub osób noszących aparaty słuchowe lub słuchawki; przeciwdziała zaleganiu wody w przewodzie słuchowym w trakcie kąpieli lub uprawiania sportów wodnych, u osób z tendencją do nawracających infekcji ucha zewnętrznego. Nie zawiera wody i konserwantów. Dzieci i niemowlęta powyżej 3. m-ca życia: 1 rozpylenie. Dorośli: 1-2 rozpylenia do przewodu słuchowego zewnętrznego. 	brak danych	brak danych	brak danych	brak danych	brak danych	brak danych	brak danych	brak danych	1
Bixebra	Iwabradyna	Leczenie objawowe przewlekłej stabilnej dławicy piersiowej. Iwabradyna jest wskazana w leczeniu objawowym przewlekłej stabilnej dławicy piersiowej u dorosłych z chorobą niedokrwienną serca, z prawidłowym rytmem zatokowym oraz z częstością akcji serca ≥70 uderzeń/min. Iwabradyna jest wskazana: u dorosłych z nietolerancją lub z przeciwwskazaniem do stosowania β-adrenolityków lub w skojarzeniu z β-adrenolitykami u pacjentów niewystarczająco kontrolowanych za pomocą optymalnej dawki β-adrenolityku. Leczenie przewlekłej niewydolności serca. Iwabradyna jest wskazana w przewlekłej niewydolności serca II-IV stopnia według klasyfikacji NYHA, z zaburzeniami czynności skurczowej, u pacjentów z rytmem zatokowym, u których częstość akcji serca wynosi  ≥75 uderzeń/min., w skojarzeniu z leczeniem standardowym, w tym z β-adrenolitykiem lub gdy leczenie β-adrenolitykiem jest przeciwwskazane albo nie jest tolerowane.	Dla różnych dawek dostępne są tabl. powlekane zawierające 5 mg i 7,5 mg iwabradyny. 	Tabl. należy przyjmować 2x/dobę, tj. 1 tabl. rano i wieczorem, podczas posiłków.	Nadwrażliwość na substancję czynną lub na którąkolwiek substancję pomocniczą. Częstość pracy serca w spoczynku przed leczeniem poniżej 70 uderzeń/minutę. Wstrząs kardiogenny. Świeży zawał mięśnia sercowego. Ciężkie niedociśnienie (<90/50 mm Hg). Ciężka niewydolność wątroby. Zespół chorego węzła zatokowego. Blok zatokowo-przedsionkowy. Niestabilna lub ostra niewydolność serca. Konieczność stosowania stymulatora serca (częstość akcji serca narzucona wyłącznie przez stymulator serca). Niestabilna dławica piersiowa. Blok przedsionkowo-komorowy 3-go stopnia. Jednoczesne stosowanie z silnymi inhibitorami cytochromu P450 3A4, takimi jak: azolowe pochodne przeciwgrzybicze (ketokonazol, itrakonazol), antybiotyki makrolidowe (klarytromycyna, erytromycyna podawana doustnie, jozamycyna, telitromycyna), inhibitory proteazy HIV (nelfinawir, rytonawir) i nefazodon. Jednoczesne stosowanie z werapamilem lub diltiazemem, które są umiarkowanymi inhibitorami CYP3A4 zmniejszającymi częstości akcji serca. Ciąża, karmienie piersią oraz leczenie u kobiet w wieku rozrodczym, które nie stosują odpowiednich metod zapobiegania ciąży.	Brak korzyści odnośnie klinicznych punktów końcowych u pacjentów z objawową przewlekłą stabilnądławicą piersiową. Iwabradyna jest wskazana tylko w leczeniu objawowym przewlekłej stabilnej dławicy piersiowej, ponieważ nie wpływa korzystnie na sercowo-naczyniowe punkty końcowe (np. za wał mięśnia sercowego lub zgon z przyczyn sercowo-naczyniowych). Ponieważ częstość akcji serca może znacznie się zmieniać się w czasie, przed rozpoczęciem leczenia iwabradyną oraz u pacjentów leczonych iwabradyną, u których rozważa się dostosowanie dawki, określając spoczynkową częstość akcji serca należy rozważyć dokonanie serii pomiarów częstości akcji serca, EKG lub 24 h monitorowania w warunkach ambulatoryjnych. Odnosi się to również do pacjentów z małą częstością akcji serca, szczególnie gdy częstość akcji serca zmniejsza się poniżej 50 uderzeń na minutę, lub po zmniejszeniu dawki Iwabradyna nie jest skuteczna w leczeniu lub zapobieganiu zaburzeniom rytmu serca i prawdopodobnie traci ona skuteczność w razie wystąpienia tachyarytmii (np. częstoskurczu komorowego lub nadkomorowego). Dlatego nie zaleca się stosowania iwabradyny u pacjentów z migotaniem przedsionków lub innymi zaburzeniami rytmu serca zakłócającymi czynność węzła zatokowego. U pacjentów leczonych iwabradyną zwiększa się ryzyko migotania przedsionków. Migotanie przedsionków było częstsze u pacjentów stosujących jednocześnie amiodaron lub silne leki przeciwarytmiczne klasy I. Zaleca się regularną kontrolę kliniczną pacjentów leczonych iwabradyną w celu obserwacji wystąpienia migotania przedsionków (utrwalonego lub napadowego), w tym, jeżeli są wskazania kliniczne (np. zaostrzenie dławicy piersiowej, kołatanie serca, nieregularne tętno), wykonywanie badania EKG. Należy poinformować pacjentów o objawach przedmiotowych i podmiotowych migotania przedsionków oraz poradzić, aby skontaktowali się z lekarzem w przypadku ich wystąpienia. Jeśli podczas leczenia wystąpi migotanie przedsionków, należy ostrożnie ponownie rozważyć stosunek korzyści do ryzyka kontynuowanego leczenia iwabradyną. Dokładnej kontroli powinni podlegać pacjenci z przewlekłą niewydolnością serca z zaburzeniami przewodzenia śródkomorowego (blok lewej odnogi pęczka Hisa, blok prawej odnogi pęczka Hisa) oraz z zaburzeniami synchronizacji komór. Iwabradyna nie jest zalecana u pacjentów z blokiem przedsionkowo-komorowym 2-go stopnia. Nie należy rozpoczynać leczenia iwabradyną u pacjentów z częstością akcji serca w spoczynku wynoszącą przed leczeniem poniżej 70 uderzeń/minutę. Jeżeli podczas leczenia częstość akcji serca w spoczynku zmniejszy się długotrwale poniżej 50 uderzeń/minutę lub pacjent odczuwa objawy związane z bradykardią, takie jak zawroty głowy, uczucie zmęczenia lub niedociśnienie, dawkę należy stopniowo zmniejszać. Jeżeli częstość akcji serca utrzymuje się nadal poniżej 50 uderzeń/minutę lub utrzymują się objawy bradykardii, należy przerwać stosowanie leku. Jednoczesne stosowanie iwabradyny w skojarzeniu z lekami z grupy antagonistów wapnia, zmniejszającymi częstość akcji serca, takimi jak werapamil lub diltiazem, jest przeciwwskazane. Nie ma potrzeby stosowania szczególnych środków bezpieczeństwa podczas stosowania iwabradyny w skojarzeniu z azotanami, antagonistami wapnia pochodnymi dihydropirydyny, takimi jak amlodypina. Dodatkowa skuteczność iwabradyny w skojarzeniu z antagonistami wapnia pochodnymi dihydropirydyny nie została ustalona. Niewydolność serca musi być ustabilizowana przed rozważeniem leczenia iwabradyną. Iwabradynę należy stosować z ostrożnością u pacjentów z niewydolnością serca IV stopnia według klasyfikacji NYHA ze względu na ograniczoną ilość danych dla tej populacji. Nie zaleca się stosowania iwabradyny bezpośrednio po wystąpieniu udaru mózgu, ponieważ nie ma danych dotyczących podawania iwabradyny w takich sytuacjach. Iwabradyna wpływa na czynność siatkówki. Nie ma dowodów toksycznego wpływu iwabradyny na siatkówkę, jednakże brak obecnie danych dotyczących wpływu iwabradyny na siatkówkę podczas długotrwałego leczenia (powyżej 1 roku). Należy rozważyć odstawienie leczenia w przypadku nieoczekiwanego pogorszenia wzroku. Należy zachować ostrożność u pacjentów z barwnikowym zwyrodnieniem siatkówki. Dostępne są ograniczone dane na temat stosowania iwabradyny u pacjentów z niedociśnieniem lekkim do umiarkowanego. W tej grupie pacjentów należy stosować iwabradynę z zachowaniem ostrożności. Iwabradyna jest przeciwwskazana do stosowania u pacjentów z ciężkim niedociśnieniem (ciśnienie tętnicze krwi <90/50 mm Hg). Brak dowodów, że u pacjentów przyjmujących iwabradynę, u których przeprowadzono kardiowersję farmakologiczną istnieje ryzyko (narastającej) bradykardii po przywróceniu rytmu zatokowego. Niemniej jednak, ze względu na brak odpowiedniej ilości danych, wykonanie kardiowersji elektrycznej w trybie planowym należy rozważyć po 24 h od przyjęcia ostatniej dawki iwabradyny. Należy unikać stosowania iwabradyny u pacjentów z wrodzonym zespołem długiego odstępu QT lub przyjmujących leki wydłużające odstęp QT. Jeżeli takie skojarzenie jest konieczne, należy ściśle monitorować czynność serca. Zmniejszenie częstości akcji serca spowodowane przez iwabradynę może nasilić wydłużenie odstępu QT, co może powodować wystąpienie ciężkich arytmii, zwłaszcza 	Jednoczesne stosowanie niezalecane produkty lecznicze wydłużające odstęp QT produkty lecznicze wydłużające odstęp QT stosowane w leczeniu chorób układu krążenia (np. chinidyna, dizopiramid, beprydyl, sotalol, ibutylid, amiodaron). Produkty lecznicze wydłużające odstęp QT stosowane w leczeniu chorób innych układów (np. pimozyd, zyprazydon, sertyndol, meflochina, halofantryna, pentamidyna, cyzapryd, erytromycyna podana dożylnie). Powinno się unikać jednoczesnego stosowania produktów leczniczych wydłużających odstęp QT, stosowanych w leczeniu chorób układu krążenia lub innych układów z iwabradyną, ponieważ zmniejszenie częstości pracy serca może nasilać wydłużenie odstępu QT. Jeżeli takie skojarzenie jest konieczne, należy ściśle monitorować czynność serca. Jednoczesne stosowanie z ostrożnością, leki moczopędne zwiększające wydalanie potasu (tiazydowe leki moczopędne i pętlowe leki moczopędne): hipokaliemia może zwiększać ryzyko arytmii. Ponieważ iwabradyna może powodować bradykardię, jednoczesne wystąpienie hipokaliemii i bradykardii jest czynnikiem predysponującym do	Kobiety w wieku rozrodczym powinny stosować podczas leczenia odpowiednie metody zapobiegania ciąży. Brak danych lub istnieją ograniczone dane dotyczące stosowania iwabradyny u kobiet w ciąży. Badania na zwierzętach wykazały toksyczny wpływ na reprodukcję. Badania te wykazały działanie embriotoksyczne i teratogenne. Potencjalne ryzyko dla ludzi nie jest znane. Z tego powodu stosowanie iwabradyny w ciąży. Badania na zwierzętach wykazują, że iwabradyna przenika do mleka. Dlatego stosowanie iwabradyny w okresie karmienia piersią jest przeciwwskazane. Kobiety wymagające leczenia iwabradyną powinny przestać karmić piersią i wybrać inny sposób karmienia dziecka. Badania na szczurach nie wykazały wpływu na płodność u samców i samic.	Przeprowadzono badania kliniczne nad działaniem iwabradyny z udziałem prawie 45 000 uczestników. Najczęściej występujące działania niepożądane iwabradyny, zaburzenia widzenia (złudne wrażenia świetlne – fotyzm) i bradykardia, zależą od dawki iwabradyny i są związane z jej działaniem farmakologicznym. Zaburzenia krwi i układu chłonnego: (niezbyt często) eozynofilia. Zaburzenia metabolizmu i odżywiania: (niezbyt często) zwiększone stężenie kwasu moczowego we krwi. Zaburzenia układu nerwowego: (często) ból głowy, zazwyczaj podczas pierwszego miesiąca leczenia, zawroty głowy, prawdopodobnie związane z bradykardią; (niezbyt często) omdlenie, prawdopodobnie związane z bradykardią. Zaburzenia oka: (bardzo często) zaburzenia widzenia (wrażenie widzenia silnego światła); (często) niewyraźne widzenie; (niezbyt często) podwójne widzenie, osłabione widzenie. Zaburzenia ucha i błędnika: (niezbyt często) zawroty głowy pochodzenia błędnikowego. Zaburzenia serca: (często) bradykardia blok przedsionkowo-komorowy I stopnia (wydłużony odstęp PQ w zapisie EKG), dodatkowe skurcze komorowe, migotanie przedsionków; (niezbyt często) kołatanie serca, dodatkowe skurcze nadkomorowe; (bardzo rzadko) blok przedsionkowo-komorowy II stopnia, blok przedsionkowo-komorowy III stopnia. Zaburzenia naczyniowe: (często) niekontrolowane ciśnienie tętnicze; (niezbyt często) niedociśnienie, prawdopodobnie związane z bradykardią. Zaburzenia układu oddechowego, klatki piersiowej i śródpiersia: (niezbyt często) duszność. Zaburzenia żołądka i jelit: (niezbyt często) nudności, zaparcia, biegunka, ból brzucha. Zaburzenia skóry i tkanki podskórnej: (niezbyt często) obrzęk naczynioruchowy, wysypka; (rzadko) rumień, świąd, pokrzywka. Zaburzenia mięśniowo-szkieletowe i tkanki łącznej: (niezbyt często) kurcze mięśni. Zaburzenia ogólne i stany w miejscu podania: (niezbyt często) astenia, prawdopodobnie związana z bradykardią, zmęczenie, prawdopodobnie związane z bradykardią; (rzadko) złe samopoczucie, prawdopodobnie związane z bradykardią. Badania diagnostyczne: (niezbyt często) zwiększone stężenie kreatyniny we krwi, wydłużenie odstępu QT widoczne w zapisie EKG. Zaburzenia widzenia, opisywane jako przemijające wrażenia widzenia silnego światła w ograniczonej części pola widzenia, zgłaszało 14,5% pacjentów. Zaburzenia te zazwyczaj są wywołane przez nagłe zmiany natężenia światła. Zaburzenia widzenia mogą być także opisywane jako aureola, dekompozycja obrazu (efekt stroboskopowy lub kalejdoskopowy), kolorowe jasne światła lub zwielokrotnione obrazy (przetrwałe wrażenie wzrokowe na siatkówce, ang. retinal persistency). Zaburzenia widzenia na ogół występują w ciągu pierwszych dwóch miesięcy leczenia. W późniejszym okresie mogą się one powtarzać. Na ogół opisywano zaburzenia widzenia jako lekkie lub o umiarkowanym nasileniu. Wszystkie zaburzenia widzenia w postaci wrażenia widzenia silnego światła ustępowały w czasie leczenia lub po jego zakończeniu, w większości przypadków w czasie leczenia (77,5%). Mniej niż 1% pacjentów zmieniło tryb zwykłych czynności życia codziennego albo przerwało leczenie w związku z opisanymi zaburzeniami widzenia. Bradykardia była zgłaszana u 3,3% pacjentów, szczególnie w ciągu pierwszych 2-3 m-c leczenia. U 0,5% pacjentów występowała ciężka bradykardia, z częstością pracy serca wynoszącą 40 uderzeń/minutę lub mniej. W badaniu migotanie przedsionków obserwowano u 5,3% pacjentów przyjmujących iwabradynę, w porównaniu do 3,8% pacjentów w grupie placebo. W sumarycznej analizie wszystkich kontrolowanych badań klinicznych fazy II/III z podwójnie ślepą próbą, z czasem trwania co najmniej 3 m-c, obejmujących ponad 40 000 pacjentów, wskaźnik zapadalności na migotanie przedsionków wyniósł 4,86% u pacjentów leczonych iwabradyną w porównaniu do 4,08% w grupie kontrolnej, czemu odpowiada współczynnik ryzyka: 1,26, 95% CI [1,15-1,39].	Przedawkowanie może prowadzić do ciężkiej i przedłużającej się bradykardii. Ciężką bradykardię należy leczyć objawowo, w specjalistycznym oddziale. W razie wystąpienia bradykardii ze słabą tolerancją hemodynamiczną, należy rozważyć zastosowanie leczenia objawowego, w tym dożylne podanie produktów leczniczych o działaniu pobudzającym receptory β, na przykład izoprenaliny. W razie konieczności należy zastosować okresowo sztuczną elektrostymulację serca.	2
Cannabis sativa L., Red No 2	Konopia siewna susz	brak danych	brak danych	brak danych	brak danych	brak danych	brak danych	brak danych	brak danych	brak danych	3
\.


--
-- Data for Name: drugs_favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drugs_favourites (id, drugs_id, user_id) FROM stdin;
11	3	6
12	2	1
\.


--
-- Data for Name: forum_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_author (id, fullname, slug, bio, points, profile_pic, user_id) FROM stdin;
2	Marcin	marcin	<p>.</p>	0	authors/profile_img_UMxxo4I.jpeg	1
4				0	authors/profile_img_Jh8ZzxH.jpeg	6
\.


--
-- Data for Name: forum_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_category (id, title, slug, description) FROM stdin;
2	bixebra	bixebra	description
3	akustone	akustone	description
\.


--
-- Data for Name: forum_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_comment (id, content, date, user_id) FROM stdin;
15	789	2021-09-28 20:33:00.528238+02	4
16	sdasd	2021-10-25 22:57:04.65682+02	2
17	asadsd	2021-10-25 22:58:13.537969+02	2
18	adsasd	2021-10-25 22:58:30.925113+02	2
19	komentarz do postu	2022-01-01 16:13:53.402516+01	2
\.


--
-- Data for Name: forum_comment_replies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_comment_replies (id, comment_id, reply_id) FROM stdin;
7	17	7
8	19	8
\.


--
-- Data for Name: forum_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_post (id, title, slug, date, approved, user_id, closed, content, state) FROM stdin;
18	123	123	2021-09-28 19:22:32.013576+02	t	2	f	123	zero
19	456	456	2021-09-28 19:50:50.579096+02	t	2	f	456	zero
20	789	789	2021-09-28 20:28:53.763793+02	t	4	f	789	zero
21	10 11	10-11	2021-09-28 20:54:28.465514+02	t	4	f	10 11	zero
22	post	post	2022-01-01 16:04:33.746998+01	t	2	f	asdsad	zero
25	4567	4567	2022-01-01 17:27:17.90853+01	t	2	f	sdasdffff	zero
\.


--
-- Data for Name: forum_post_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_post_categories (id, post_id, category_id) FROM stdin;
8	18	2
9	19	3
10	20	3
11	21	3
12	22	3
13	25	2
\.


--
-- Data for Name: forum_post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_post_comments (id, post_id, comment_id) FROM stdin;
25	19	15
26	18	16
27	20	17
28	20	18
29	22	19
\.


--
-- Data for Name: forum_reply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_reply (id, content, date, user_id) FROM stdin;
7	asdasd	2021-10-25 22:58:19.551956+02	2
8	odpowiedz do komentarza	2022-01-01 16:14:25.767125+01	2
\.


--
-- Data for Name: hitcount_blacklist_ip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hitcount_blacklist_ip (id, ip) FROM stdin;
\.


--
-- Data for Name: hitcount_blacklist_user_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hitcount_blacklist_user_agent (id, user_agent) FROM stdin;
\.


--
-- Data for Name: hitcount_hit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hitcount_hit (id, created, ip, session, user_agent, hitcount_id, user_id) FROM stdin;
14	2021-09-28 19:23:41.135371+02	127.0.0.1	ykz8m81dlt0nql8txnvmhbvrevdwa36n	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36	13	1
15	2021-09-28 19:51:16.14539+02	127.0.0.1	6hkhfi1g7cbzcmqazyq2yjbdkdp6bjml	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36	14	1
16	2021-09-28 20:30:43.094347+02	127.0.0.1	1j73mzi26wiqzott8077izicsek0moa9	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36	14	6
17	2021-09-28 20:32:18.297029+02	127.0.0.1	1j73mzi26wiqzott8077izicsek0moa9	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36	15	6
18	2021-09-28 20:35:09.478953+02	127.0.0.1	1j73mzi26wiqzott8077izicsek0moa9	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36	13	6
19	2021-09-29 09:16:09.426605+02	127.0.0.1	7vm2oph3k2rvp5t5muifutwgj8z7mxcj	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36	16	1
20	2021-10-25 22:56:59.984637+02	127.0.0.1	50tyhhmpttu1y0hyaih1j6l49vryzahu	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36	13	1
21	2021-10-25 22:58:02.735666+02	127.0.0.1	50tyhhmpttu1y0hyaih1j6l49vryzahu	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36	15	1
22	2021-10-30 12:25:21.045392+02	127.0.0.1	5zgul187chlrdirgu7l1uth944j0d719	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36	14	1
23	2021-11-27 14:52:25.966812+01	127.0.0.1	pkm1rasv5ucnihiby6gls4ocy6itbgvl	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36	14	1
24	2021-11-27 14:53:00.744555+01	127.0.0.1	pkm1rasv5ucnihiby6gls4ocy6itbgvl	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36	16	1
25	2021-11-27 14:53:05.746915+01	127.0.0.1	pkm1rasv5ucnihiby6gls4ocy6itbgvl	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36	13	1
26	2021-11-27 14:53:40.411982+01	127.0.0.1	pkm1rasv5ucnihiby6gls4ocy6itbgvl	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36	15	1
27	2022-01-01 16:10:55.62707+01	127.0.0.1	4jtmyl04jcfv5br1zwff92cbj6h3m33l	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36	17	1
28	2022-01-01 16:17:49.766528+01	127.0.0.1	4jtmyl04jcfv5br1zwff92cbj6h3m33l	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36	13	1
29	2022-01-01 17:13:36.249964+01	127.0.0.1	4jtmyl04jcfv5br1zwff92cbj6h3m33l	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36	14	1
30	2022-01-01 17:40:58.273371+01	127.0.0.1	4jtmyl04jcfv5br1zwff92cbj6h3m33l	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36	18	1
\.


--
-- Data for Name: hitcount_hit_count; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hitcount_hit_count (id, hits, modified, object_pk, content_type_id) FROM stdin;
16	2	2021-11-27 14:53:00.741379+01	21	14
15	3	2021-11-27 14:53:40.406661+01	20	14
17	1	2022-01-01 16:10:55.624259+01	22	14
13	5	2022-01-01 16:17:49.763113+01	18	14
14	5	2022-01-01 17:13:36.244418+01	19	14
18	1	2022-01-01 17:40:58.269424+01	25	14
\.


--
-- Data for Name: index_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.index_comment (id, body, date_added, drug_id, name_id) FROM stdin;
40	pjk	2021-09-28 17:54:29.768655+02	2	1
41	asd123	2021-10-30 12:51:29.608165+02	2	1
29	Ogólnie znana teza głosi, iż użytkownika może rozpraszać zrozumiała zawartość strony, kiedy ten chce zobaczyć sam jej wygląd. Jedną z mocnych stron używania Lorem Ipsum jest to, że ma wiele różnych „kombinacji” zdań, słów i akapitów, w przeciwieństwie do zwykłego: „tekst, tekst, tekst”, sprawiającego, że wygląda to „zbyt czytelnie” po polsku.	2021-09-10 15:05:29.865202+02	1	1
30	Ogólnie znana teza głosi, iż użytkownika może rozpraszać zrozumiała zawartość strony, kiedy ten chce zobaczyć sam jej wygląd. Jedną z mocnych stron używania Lorem Ipsum jest to, że ma wiele różnych „kombinacji” zdań, słów i akapitów, w przeciwieństwie do zwykłego: „tekst, tekst, tekst”, sprawiającego, że wygląda to „zbyt czytelnie” po polsku.	2021-09-10 15:05:47.091164+02	2	1
33	xxx	2021-09-10 15:33:13.575576+02	1	1
34	y	2021-09-10 16:18:43.445312+02	1	1
35	g	2021-09-10 18:43:02.852346+02	1	1
36	ssss	2021-09-10 18:58:55.402819+02	1	1
38	ads	2021-09-12 18:47:03.050089+02	3	1
39	z	2021-09-13 18:11:01.548432+02	1	1
\.


--
-- Data for Name: index_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.index_post (id, body, author_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
1	sa	sa
2	asasas	asasas
3	aaaa	aaaa
4	q	q
5	2	2
6	123	123
7	456	456
8	789	789
9	11	11
10	10	10
11	ss	ss
12	ssddd	ssddd
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
8	18	14	6
9	19	14	7
10	20	14	8
11	21	14	9
12	21	14	10
13	22	14	11
14	25	14	12
\.


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_profile (id, image, user_id) FROM stdin;
5	profile_pics/profile_img_yRE36IH.jpg	4
7	default.jpg	6
3	profile_pics/profile_img.jpg	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 6, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 75, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 52, true);


--
-- Name: drugs_favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drugs_favourites_id_seq', 12, true);


--
-- Name: drugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drugs_id_seq', 3, true);


--
-- Name: forum_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forum_author_id_seq', 4, true);


--
-- Name: forum_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forum_category_id_seq', 3, true);


--
-- Name: forum_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forum_comment_id_seq', 19, true);


--
-- Name: forum_comment_reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forum_comment_reply_id_seq', 8, true);


--
-- Name: forum_post_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forum_post_categories_id_seq', 13, true);


--
-- Name: forum_post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forum_post_comments_id_seq', 29, true);


--
-- Name: forum_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forum_post_id_seq', 25, true);


--
-- Name: forum_reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forum_reply_id_seq', 8, true);


--
-- Name: hitcount_blacklist_ip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hitcount_blacklist_ip_id_seq', 1, false);


--
-- Name: hitcount_blacklist_user_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hitcount_blacklist_user_agent_id_seq', 1, false);


--
-- Name: hitcount_hit_count_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hitcount_hit_count_id_seq', 18, true);


--
-- Name: hitcount_hit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hitcount_hit_id_seq', 30, true);


--
-- Name: index_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.index_comment_id_seq', 41, true);


--
-- Name: index_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.index_post_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 12, true);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 14, true);


--
-- Name: users_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_profile_id_seq', 7, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: drugs drugs_drugname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs
    ADD CONSTRAINT drugs_drugname_key UNIQUE (drugname);


--
-- Name: drugs_favourites drugs_favourites_drugs_id_user_id_843b5809_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs_favourites
    ADD CONSTRAINT drugs_favourites_drugs_id_user_id_843b5809_uniq UNIQUE (drugs_id, user_id);


--
-- Name: drugs_favourites drugs_favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs_favourites
    ADD CONSTRAINT drugs_favourites_pkey PRIMARY KEY (id);


--
-- Name: drugs drugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs
    ADD CONSTRAINT drugs_pkey PRIMARY KEY (id);


--
-- Name: forum_author forum_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_author
    ADD CONSTRAINT forum_author_pkey PRIMARY KEY (id);


--
-- Name: forum_author forum_author_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_author
    ADD CONSTRAINT forum_author_slug_key UNIQUE (slug);


--
-- Name: forum_category forum_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_category
    ADD CONSTRAINT forum_category_pkey PRIMARY KEY (id);


--
-- Name: forum_category forum_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_category
    ADD CONSTRAINT forum_category_slug_key UNIQUE (slug);


--
-- Name: forum_comment forum_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_comment
    ADD CONSTRAINT forum_comment_pkey PRIMARY KEY (id);


--
-- Name: forum_comment_replies forum_comment_reply_comment_id_reply_id_f266a34f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_comment_replies
    ADD CONSTRAINT forum_comment_reply_comment_id_reply_id_f266a34f_uniq UNIQUE (comment_id, reply_id);


--
-- Name: forum_comment_replies forum_comment_reply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_comment_replies
    ADD CONSTRAINT forum_comment_reply_pkey PRIMARY KEY (id);


--
-- Name: forum_post_categories forum_post_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post_categories
    ADD CONSTRAINT forum_post_categories_pkey PRIMARY KEY (id);


--
-- Name: forum_post_categories forum_post_categories_post_id_category_id_0299a8e4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post_categories
    ADD CONSTRAINT forum_post_categories_post_id_category_id_0299a8e4_uniq UNIQUE (post_id, category_id);


--
-- Name: forum_post_comments forum_post_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post_comments
    ADD CONSTRAINT forum_post_comments_pkey PRIMARY KEY (id);


--
-- Name: forum_post_comments forum_post_comments_post_id_comment_id_aeb5c6a1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post_comments
    ADD CONSTRAINT forum_post_comments_post_id_comment_id_aeb5c6a1_uniq UNIQUE (post_id, comment_id);


--
-- Name: forum_post forum_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post
    ADD CONSTRAINT forum_post_pkey PRIMARY KEY (id);


--
-- Name: forum_post forum_post_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post
    ADD CONSTRAINT forum_post_slug_key UNIQUE (slug);


--
-- Name: forum_reply forum_reply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_reply
    ADD CONSTRAINT forum_reply_pkey PRIMARY KEY (id);


--
-- Name: hitcount_blacklist_ip hitcount_blacklist_ip_ip_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_blacklist_ip
    ADD CONSTRAINT hitcount_blacklist_ip_ip_key UNIQUE (ip);


--
-- Name: hitcount_blacklist_ip hitcount_blacklist_ip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_blacklist_ip
    ADD CONSTRAINT hitcount_blacklist_ip_pkey PRIMARY KEY (id);


--
-- Name: hitcount_blacklist_user_agent hitcount_blacklist_user_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_blacklist_user_agent
    ADD CONSTRAINT hitcount_blacklist_user_agent_pkey PRIMARY KEY (id);


--
-- Name: hitcount_blacklist_user_agent hitcount_blacklist_user_agent_user_agent_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_blacklist_user_agent
    ADD CONSTRAINT hitcount_blacklist_user_agent_user_agent_key UNIQUE (user_agent);


--
-- Name: hitcount_hit_count hitcount_hit_count_content_type_id_object_pk_4dacb610_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_hit_count
    ADD CONSTRAINT hitcount_hit_count_content_type_id_object_pk_4dacb610_uniq UNIQUE (content_type_id, object_pk);


--
-- Name: hitcount_hit_count hitcount_hit_count_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_hit_count
    ADD CONSTRAINT hitcount_hit_count_pkey PRIMARY KEY (id);


--
-- Name: hitcount_hit hitcount_hit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_hit
    ADD CONSTRAINT hitcount_hit_pkey PRIMARY KEY (id);


--
-- Name: index_comment index_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.index_comment
    ADD CONSTRAINT index_comment_pkey PRIMARY KEY (id);


--
-- Name: index_post index_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.index_post
    ADD CONSTRAINT index_post_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: users_profile users_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_pkey PRIMARY KEY (id);


--
-- Name: users_profile users_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: drugs_favourites_drugs_id_626b2815; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drugs_favourites_drugs_id_626b2815 ON public.drugs_favourites USING btree (drugs_id);


--
-- Name: drugs_favourites_user_id_74b5af3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drugs_favourites_user_id_74b5af3b ON public.drugs_favourites USING btree (user_id);


--
-- Name: forum_author_slug_46365cfd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_author_slug_46365cfd_like ON public.forum_author USING btree (slug varchar_pattern_ops);


--
-- Name: forum_author_user_id_b3d63836; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_author_user_id_b3d63836 ON public.forum_author USING btree (user_id);


--
-- Name: forum_category_slug_50ca1b25_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_category_slug_50ca1b25_like ON public.forum_category USING btree (slug varchar_pattern_ops);


--
-- Name: forum_comment_reply_comment_id_8126cd18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_comment_reply_comment_id_8126cd18 ON public.forum_comment_replies USING btree (comment_id);


--
-- Name: forum_comment_reply_reply_id_1245de00; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_comment_reply_reply_id_1245de00 ON public.forum_comment_replies USING btree (reply_id);


--
-- Name: forum_comment_user_id_ee1c4b93; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_comment_user_id_ee1c4b93 ON public.forum_comment USING btree (user_id);


--
-- Name: forum_post_categories_category_id_4f877c80; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_post_categories_category_id_4f877c80 ON public.forum_post_categories USING btree (category_id);


--
-- Name: forum_post_categories_post_id_cd6b2573; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_post_categories_post_id_cd6b2573 ON public.forum_post_categories USING btree (post_id);


--
-- Name: forum_post_comments_comment_id_2a5361ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_post_comments_comment_id_2a5361ab ON public.forum_post_comments USING btree (comment_id);


--
-- Name: forum_post_comments_post_id_b3fc41b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_post_comments_post_id_b3fc41b7 ON public.forum_post_comments USING btree (post_id);


--
-- Name: forum_post_slug_ffc04388_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_post_slug_ffc04388_like ON public.forum_post USING btree (slug varchar_pattern_ops);


--
-- Name: forum_post_user_id_9caccb96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_post_user_id_9caccb96 ON public.forum_post USING btree (user_id);


--
-- Name: forum_reply_user_id_73f8e234; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forum_reply_user_id_73f8e234 ON public.forum_reply USING btree (user_id);


--
-- Name: hitcount_blacklist_ip_ip_b1955e95_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitcount_blacklist_ip_ip_b1955e95_like ON public.hitcount_blacklist_ip USING btree (ip varchar_pattern_ops);


--
-- Name: hitcount_blacklist_user_agent_user_agent_fbf2061c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitcount_blacklist_user_agent_user_agent_fbf2061c_like ON public.hitcount_blacklist_user_agent USING btree (user_agent varchar_pattern_ops);


--
-- Name: hitcount_hit_count_content_type_id_4a734fe1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitcount_hit_count_content_type_id_4a734fe1 ON public.hitcount_hit_count USING btree (content_type_id);


--
-- Name: hitcount_hit_created_79adf7bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitcount_hit_created_79adf7bc ON public.hitcount_hit USING btree (created);


--
-- Name: hitcount_hit_hitcount_id_b7971910; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitcount_hit_hitcount_id_b7971910 ON public.hitcount_hit USING btree (hitcount_id);


--
-- Name: hitcount_hit_ip_a52a62aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitcount_hit_ip_a52a62aa ON public.hitcount_hit USING btree (ip);


--
-- Name: hitcount_hit_ip_a52a62aa_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitcount_hit_ip_a52a62aa_like ON public.hitcount_hit USING btree (ip varchar_pattern_ops);


--
-- Name: hitcount_hit_session_5be83758; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitcount_hit_session_5be83758 ON public.hitcount_hit USING btree (session);


--
-- Name: hitcount_hit_session_5be83758_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitcount_hit_session_5be83758_like ON public.hitcount_hit USING btree (session varchar_pattern_ops);


--
-- Name: hitcount_hit_user_id_f7067f66; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitcount_hit_user_id_f7067f66 ON public.hitcount_hit USING btree (user_id);


--
-- Name: index_comment_drug_id_b8704c64; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comment_drug_id_b8704c64 ON public.index_comment USING btree (drug_id);


--
-- Name: index_comment_name_id_f2a56209; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comment_name_id_f2a56209 ON public.index_comment USING btree (name_id);


--
-- Name: index_post_author_id_dde7601c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_post_author_id_dde7601c ON public.index_post USING btree (author_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drugs_favourites drugs_favourites_drugs_id_626b2815_fk_drugs_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs_favourites
    ADD CONSTRAINT drugs_favourites_drugs_id_626b2815_fk_drugs_id FOREIGN KEY (drugs_id) REFERENCES public.drugs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drugs_favourites drugs_favourites_user_id_74b5af3b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drugs_favourites
    ADD CONSTRAINT drugs_favourites_user_id_74b5af3b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_author forum_author_user_id_b3d63836_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_author
    ADD CONSTRAINT forum_author_user_id_b3d63836_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_comment_replies forum_comment_reply_comment_id_8126cd18_fk_forum_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_comment_replies
    ADD CONSTRAINT forum_comment_reply_comment_id_8126cd18_fk_forum_comment_id FOREIGN KEY (comment_id) REFERENCES public.forum_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_comment_replies forum_comment_reply_reply_id_1245de00_fk_forum_reply_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_comment_replies
    ADD CONSTRAINT forum_comment_reply_reply_id_1245de00_fk_forum_reply_id FOREIGN KEY (reply_id) REFERENCES public.forum_reply(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_comment forum_comment_user_id_ee1c4b93_fk_forum_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_comment
    ADD CONSTRAINT forum_comment_user_id_ee1c4b93_fk_forum_author_id FOREIGN KEY (user_id) REFERENCES public.forum_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_post_categories forum_post_categories_category_id_4f877c80_fk_forum_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post_categories
    ADD CONSTRAINT forum_post_categories_category_id_4f877c80_fk_forum_category_id FOREIGN KEY (category_id) REFERENCES public.forum_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_post_categories forum_post_categories_post_id_cd6b2573_fk_forum_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post_categories
    ADD CONSTRAINT forum_post_categories_post_id_cd6b2573_fk_forum_post_id FOREIGN KEY (post_id) REFERENCES public.forum_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_post_comments forum_post_comments_comment_id_2a5361ab_fk_forum_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post_comments
    ADD CONSTRAINT forum_post_comments_comment_id_2a5361ab_fk_forum_comment_id FOREIGN KEY (comment_id) REFERENCES public.forum_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_post_comments forum_post_comments_post_id_b3fc41b7_fk_forum_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post_comments
    ADD CONSTRAINT forum_post_comments_post_id_b3fc41b7_fk_forum_post_id FOREIGN KEY (post_id) REFERENCES public.forum_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_post forum_post_user_id_9caccb96_fk_forum_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_post
    ADD CONSTRAINT forum_post_user_id_9caccb96_fk_forum_author_id FOREIGN KEY (user_id) REFERENCES public.forum_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forum_reply forum_reply_user_id_73f8e234_fk_forum_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_reply
    ADD CONSTRAINT forum_reply_user_id_73f8e234_fk_forum_author_id FOREIGN KEY (user_id) REFERENCES public.forum_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hitcount_hit_count hitcount_hit_count_content_type_id_4a734fe1_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_hit_count
    ADD CONSTRAINT hitcount_hit_count_content_type_id_4a734fe1_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hitcount_hit hitcount_hit_hitcount_id_b7971910_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_hit
    ADD CONSTRAINT hitcount_hit_hitcount_id_b7971910_fk FOREIGN KEY (hitcount_id) REFERENCES public.hitcount_hit_count(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hitcount_hit hitcount_hit_user_id_f7067f66_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitcount_hit
    ADD CONSTRAINT hitcount_hit_user_id_f7067f66_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: index_comment index_comment_drug_id_b8704c64_fk_drugs_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.index_comment
    ADD CONSTRAINT index_comment_drug_id_b8704c64_fk_drugs_id FOREIGN KEY (drug_id) REFERENCES public.drugs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: index_comment index_comment_name_id_f2a56209_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.index_comment
    ADD CONSTRAINT index_comment_name_id_f2a56209_fk_auth_user_id FOREIGN KEY (name_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: index_post index_post_author_id_dde7601c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.index_post
    ADD CONSTRAINT index_post_author_id_dde7601c_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profile users_profile_user_id_2112e78d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_user_id_2112e78d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

