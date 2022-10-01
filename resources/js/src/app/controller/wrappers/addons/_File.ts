/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'
type parent_table_t = '__users' | '__messages' | '__feedback_reports' | '__requests' | '__certificates' | '__student_extensions' | '__applicant_applications' | '__student_academic_year_records' | 'student_bank_accounts' | '__student_residence_permits' | '__student_residence_records' | '__passports'
type filegroup_t = 'images' | 'documents'

type image_filename_ext_t = 'jpeg' | 'jpg' | 'png' | 'gif' | 'bmp'
type document_filename_ext_t = 'txt' | 'pdf' | 'rtf' | 'doc' | 'docx' | 'csv' | 'xls' | 'xlsx' | 'ppt' | 'pptx' | 'ppsx'
type filename_ext_t = image_filename_ext_t | document_filename_ext_t

type image_tag_t = 'chat_message_image' | 'feedback_report_image' | 'user_profile_image' | 'education_institution_badge' | 'event_poster'
type document_tag_t = 'chat_message_document' | 'requestable_document' | 'certificate' | 'student_registration_certificate' | 'student_academic_transcript' | 'bank_id_extract' | 'student_residence_permit' | 'student_residence_certificate' | 'user_passport' | 'application_letter' | 'motivation_letter' | 'curriculum_vitae'
type tag_t = image_tag_t | document_tag_t

type get_collection_params = {
    get_with_meta?: boolean,
    search_query_string?: string,
    user_username?: string,
    parent_table?: parent_table_t,
    parent_uid?: string | number,
    filegroup?: filegroup_t,
    tag?: tag_t,
}

/* 
    RespObj Export
*/
export const _FileRespObj = {
    id: undefined as undefined | null | number,
    parent_table: undefined as undefined | null | parent_table_t,
    parent_uid: undefined as undefined | null | string | number,

    upload_id: undefined as undefined | null | string, // Not saved

    filegroup: undefined as undefined | null | filegroup_t,
    tag: undefined as undefined | null | tag_t,

    title: undefined as undefined | null | string, // used as alt
    width: undefined as undefined | null | number,
    height: undefined as undefined | null | number,

    uri: undefined as undefined | null | string, // used as src
    type: undefined as undefined | null | string,
    filesize: undefined as undefined | null | number, // alias size
    original_filename: undefined as undefined | null | string,
    order_index: undefined as undefined | null | number,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}


/*
    Exported Default Class
*/
export default class _File extends _Wrapper_ implements Omit<typeof _FileRespObj, casts_t | 'upload_id'> {
    id: number | null = null
    parent_table: parent_table_t | null = null
    parent_uid: string | number | null = null

    filegroup: filegroup_t | null = null
    tag: tag_t | null = null

    title: string | null = null
    width: number | null = null
    height: number | null = null

    uri: string | null = null
    type: string | null = null
    filesize: number | null = null
    filename: string | null = null
    filename_name: string | null = null
    filename_ext: filename_ext_t | null = null
    original_filename: string | null = null

    order_index: number | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _FileRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _FileRespObj) {
        this._populate(args)
        /*const uri_elems = this.uri.split('/')
        this.filename = uri_elems[uri_elems.length - 1]
        const filename_elems = this.filename.split('.')
        this.filename_ext = filename_elems[filename_elems.length - 1] as filename_ext_t
        this.filename_name = filename_elems[0]*/
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(file: typeof _FileRespObj) {
        const files = (await this.upload([file], file.filegroup as filegroup_t, file.parent_table as parent_table_t).catch((e: any) => { return Promise.reject(e) }))
        if (!files) {
            return Promise.reject({ message: 'An error occured' })
        }
        return this._mainLaravelDBAPICreate('content/files', { ...files[0], type: files[0].type })
    }

    static async upload(files: typeof _FileRespObj[], filegroup: filegroup_t, parent_table: parent_table_t) {
        if (!filegroup || !parent_table) {
            return Promise.reject({ message: 'Missing upload arguments' })
        }
        if (files && files.length) {
            const data = new FormData();
            for (let i = 0; i < files.length; i++) {
                data.append('files[]', files[i] as any);
            }
            const resp: any = await this._mainLaravelDBAPICreate('content/files/upload?filegroup=' + filegroup + '&parent_table=' + parent_table, data, null, true).catch((e: any) => { return Promise.reject(e) });
            for (let i = 0; i < files.length; i++) {
                const uploaded_file = resp.files.find((t: any) => t.original_filename === files[i].original_filename)
                files[i].uri = uploaded_file.uri
                files[i].filesize = uploaded_file.filesize
            }
            return files
        } else {
            return Promise.reject({ message: 'No files to upload' })
        }
    }

    /* Readers */

    public static async getOneWhere(params: { tag?: tag_t, parent_table?: parent_table_t, parent_uid?: string | number }) {
        return this._mainLaravelDBAPIGetOneWhere('content/files', params)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('content/files', params, page_select, per_page)
    }

    /* Deleter */
    public async delete() {
        return this._delete('content/files/' + this.id)
    }
}